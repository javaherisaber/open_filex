package com.crazecoder.openfile;

import static org.junit.Assert.assertNotNull;
import static org.junit.Assert.assertNull;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.anyString;
import static org.mockito.Mockito.doAnswer;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.when;

import android.app.Activity;
import android.content.Context;

import java.util.HashMap;
import java.util.Map;

import org.junit.Before;
import org.junit.Test;
import org.mockito.stubbing.Answer;

import io.flutter.embedding.engine.plugins.FlutterPlugin.FlutterPluginBinding;
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding;
import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.BinaryMessenger.BinaryMessageHandler;

public class OpenFilePluginTest {
    private static final String CHANNEL = "open_file";

    private final Map<String, BinaryMessageHandler> handlers = new HashMap<>();
    private FlutterPluginBinding engine;
    private OpenFilePlugin plugin;

    @Before
    public void setUp() {
        BinaryMessenger messenger = mock(BinaryMessenger.class);
        Answer<Void> recordHandler = invocation -> {
            handlers.put(invocation.getArgument(0), invocation.getArgument(1));
            return null;
        };
        doAnswer(recordHandler).when(messenger).setMessageHandler(anyString(), any());
        doAnswer(recordHandler).when(messenger).setMessageHandler(anyString(), any(), any());

        engine = mock(FlutterPluginBinding.class);
        when(engine.getBinaryMessenger()).thenReturn(messenger);
        when(engine.getApplicationContext()).thenReturn(mock(Context.class));

        plugin = new OpenFilePlugin();
    }

    // A cached engine outlives its Activity: the next Activity attaches to the
    // same plugin instance without a new onAttachedToEngine.
    @Test
    public void keepsChannelWhenEngineOutlivesActivity() {
        plugin.onAttachedToEngine(engine);
        plugin.onAttachedToActivity(activityBinding());

        plugin.onDetachedFromActivity();
        plugin.onAttachedToActivity(activityBinding());

        assertNotNull(handlers.get(CHANNEL));
    }

    @Test
    public void keepsChannelAcrossConfigChange() {
        plugin.onAttachedToEngine(engine);
        plugin.onAttachedToActivity(activityBinding());

        plugin.onDetachedFromActivityForConfigChanges();
        plugin.onReattachedToActivityForConfigChanges(activityBinding());

        assertNotNull(handlers.get(CHANNEL));
    }

    @Test
    public void releasesChannelWithEngine() {
        plugin.onAttachedToEngine(engine);
        plugin.onAttachedToActivity(activityBinding());

        plugin.onDetachedFromActivity();
        plugin.onDetachedFromEngine(engine);

        assertNull(handlers.get(CHANNEL));
    }

    private static ActivityPluginBinding activityBinding() {
        ActivityPluginBinding binding = mock(ActivityPluginBinding.class);
        when(binding.getActivity()).thenReturn(mock(Activity.class));
        return binding;
    }
}
