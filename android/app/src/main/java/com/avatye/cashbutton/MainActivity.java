package com.avatye.cashbutton;

import android.os.Bundle;
import android.os.PersistableBundle;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import com.avatye.sdk.cashbutton.CashButtonConfig;
import com.avatye.sdk.cashbutton.ICashButtonCallback;
import com.avatye.sdk.cashbutton.ui.CashButtonLayout;

import org.jetbrains.annotations.NotNull;

import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.MethodChannel;


public class MainActivity extends FlutterActivity {
    private static final String CHANNEL = "cashbutton.com/value";
    private CashButtonLayout cashButton;


    @Override
    public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
        super.configureFlutterEngine(flutterEngine);

        new MethodChannel(flutterEngine.getDartExecutor().getBinaryMessenger(), CHANNEL)
                .setMethodCallHandler(
                        (call, result) -> {
                            switch (call.method) {
                                case "cashButton_init": {
                                    init();
                                    break;
                                }
                                case "suggestion": {
                                    result.success("success suggestion");
                                    startSuggestion();
                                    break;
                                }
                                default: {
                                    result.notImplemented();
                                }
                            }
                        }
                );
    }


    private void init() {
        CashButtonLayout.init(this, new ICashButtonCallback() {
            @Override
            public void onSuccess(@NotNull CashButtonLayout cashButtonLayout) {
                cashButton = cashButtonLayout;
            }
        });
    }


    private void startSuggestion() {
        CashButtonConfig.actionSuggestion(this);
    }


    @Override
    public void onCreate(@Nullable Bundle savedInstanceState, @Nullable PersistableBundle persistentState) {
        super.onCreate(savedInstanceState, persistentState);
    }

    @Override
    public void onBackPressed() {
        if (cashButton != null) {
            cashButton.onBackPressed(b -> {
                if (b) {
                    finish();
                }
            });
        } else {
            finish();
        }
    }

}
