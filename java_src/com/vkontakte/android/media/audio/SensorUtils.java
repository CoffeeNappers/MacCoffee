package com.vkontakte.android.media.audio;

import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.hardware.Sensor;
import android.hardware.SensorEvent;
import android.hardware.SensorEventListener;
import android.hardware.SensorManager;
import android.media.AudioManager;
import android.os.Handler;
import android.os.PowerManager;
import com.facebook.internal.NativeProtocol;
import com.google.android.exoplayer2.util.MimeTypes;
import com.vkontakte.android.AudioMessagePlayerService;
import com.vkontakte.android.VKApplication;
import com.vkontakte.android.utils.DispatchQueue;
import com.vkontakte.android.utils.L;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes3.dex */
public final class SensorUtils implements SensorEventListener {
    private static final String TAG = "SensorUtils";
    private final Sensor accelerometerSensor;
    private boolean accelerometerVertical;
    private boolean allowStartRecord;
    private final AudioManager audioManager;
    private int countLess;
    private final Sensor gravitySensor;
    private boolean inputFieldHasText;
    private long lastTimestamp;
    private final Sensor linearSensor;
    private float previousAccValue;
    private boolean proximityHasDifferentValues;
    private final Sensor proximitySensor;
    private boolean proximityTouched;
    private final PowerManager.WakeLock proximityWakeLock;
    private Activity raiseChat;
    private boolean raiseToEarRecord;
    private int raisedToBack;
    private int raisedToTop;
    private final SensorManager sensorManager;
    private boolean sensorsStarted;
    private String sessionId;
    private long timeSinceRaise;
    private boolean useFrontSpeaker;
    private final DispatchQueue queue = new DispatchQueue("SensorUtilsQueue");
    private float[] gravity = new float[3];
    private float[] gravityFast = new float[3];
    private float[] linearAcceleration = new float[3];
    private float lastProximityValue = -100.0f;

    /* JADX INFO: Access modifiers changed from: package-private */
    public SensorUtils() {
        Context context = VKApplication.context;
        this.audioManager = (AudioManager) context.getSystemService(MimeTypes.BASE_TYPE_AUDIO);
        this.sensorManager = (SensorManager) context.getSystemService("sensor");
        this.proximitySensor = this.sensorManager.getDefaultSensor(8);
        Sensor linearSensor = this.sensorManager.getDefaultSensor(10);
        Sensor gravitySensor = this.sensorManager.getDefaultSensor(9);
        if (gravitySensor == null || linearSensor == null) {
            L.w(TAG, "Gravity or linear sensor not found");
            this.accelerometerSensor = this.sensorManager.getDefaultSensor(1);
            this.linearSensor = null;
            this.gravitySensor = null;
        } else {
            this.accelerometerSensor = null;
            this.linearSensor = linearSensor;
            this.gravitySensor = gravitySensor;
        }
        PowerManager powerManager = (PowerManager) context.getSystemService("power");
        this.proximityWakeLock = powerManager.newWakeLock(32, "proximity");
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void setInputFieldHasText(boolean value) {
        this.inputFieldHasText = value;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void setAllowStartRecord(boolean value) {
        this.allowStartRecord = value;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void startSensors(Activity activity, String sessionId) {
        if (activity != null) {
            if ((this.accelerometerSensor != null || (this.gravitySensor != null && this.linearAcceleration != null)) && this.proximitySensor != null) {
                this.raiseChat = activity;
                this.sessionId = sessionId;
                if (!this.sensorsStarted) {
                    float[] fArr = this.gravity;
                    float[] fArr2 = this.gravity;
                    this.gravity[2] = 0.0f;
                    fArr2[1] = 0.0f;
                    fArr[0] = 0.0f;
                    float[] fArr3 = this.linearAcceleration;
                    float[] fArr4 = this.linearAcceleration;
                    this.linearAcceleration[2] = 0.0f;
                    fArr4[1] = 0.0f;
                    fArr3[0] = 0.0f;
                    float[] fArr5 = this.gravityFast;
                    float[] fArr6 = this.gravityFast;
                    this.gravityFast[2] = 0.0f;
                    fArr6[1] = 0.0f;
                    fArr5[0] = 0.0f;
                    this.previousAccValue = 0.0f;
                    this.lastTimestamp = 0L;
                    this.raisedToBack = 0;
                    this.raisedToTop = 0;
                    this.countLess = 0;
                    this.queue.postRunnable(SensorUtils$$Lambda$1.lambdaFactory$(this));
                    this.sensorsStarted = true;
                }
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$startSensors$0() {
        Handler handler = new Handler();
        if (this.gravitySensor != null) {
            this.sensorManager.registerListener(this, this.gravitySensor, 30000, handler);
        }
        if (this.linearSensor != null) {
            this.sensorManager.registerListener(this, this.linearSensor, 30000, handler);
        }
        if (this.accelerometerSensor != null) {
            this.sensorManager.registerListener(this, this.accelerometerSensor, 30000, handler);
        }
        this.sensorManager.registerListener(this, this.proximitySensor, 3, handler);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public void stopSensors(Activity activity) {
        if (this.sensorsStarted) {
            if ((this.accelerometerSensor != null || (this.gravitySensor != null && this.linearAcceleration != null)) && this.proximitySensor != null && this.raiseChat == activity) {
                this.raiseChat = null;
                this.sessionId = null;
                AudioMessageUtils.getInstance().stopRecording();
                this.accelerometerVertical = false;
                this.proximityTouched = false;
                this.raiseToEarRecord = false;
                this.useFrontSpeaker = false;
                this.sensorsStarted = false;
                this.queue.postRunnable(SensorUtils$$Lambda$2.lambdaFactory$(this));
                screenLocker(false);
            }
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public /* synthetic */ void lambda$stopSensors$1() {
        if (this.linearSensor != null) {
            this.sensorManager.unregisterListener(this, this.linearSensor);
        }
        if (this.gravitySensor != null) {
            this.sensorManager.unregisterListener(this, this.gravitySensor);
        }
        if (this.accelerometerSensor != null) {
            this.sensorManager.unregisterListener(this, this.accelerometerSensor);
        }
        this.sensorManager.unregisterListener(this, this.proximitySensor);
    }

    @Override // android.hardware.SensorEventListener
    public void onSensorChanged(SensorEvent event) {
        if (this.sensorsStarted) {
            if (event.sensor == this.proximitySensor) {
                L.d(TAG, "proximity changed to " + event.values[0]);
                if (this.lastProximityValue == -100.0f) {
                    this.lastProximityValue = event.values[0];
                } else if (this.lastProximityValue != event.values[0]) {
                    this.proximityHasDifferentValues = true;
                }
                if (this.proximityHasDifferentValues) {
                    this.proximityTouched = isNearToSensor(event.values[0]);
                }
            } else if (event.sensor == this.accelerometerSensor) {
                double alpha = this.lastTimestamp == 0 ? 0.9800000190734863d : 1.0d / (1.0d + ((event.timestamp - this.lastTimestamp) / 1.0E9d));
                this.lastTimestamp = event.timestamp;
                this.gravity[0] = (float) ((this.gravity[0] * alpha) + ((1.0d - alpha) * event.values[0]));
                this.gravity[1] = (float) ((this.gravity[1] * alpha) + ((1.0d - alpha) * event.values[1]));
                this.gravity[2] = (float) ((this.gravity[2] * alpha) + ((1.0d - alpha) * event.values[2]));
                this.gravityFast[0] = (0.8f * this.gravity[0]) + (0.19999999f * event.values[0]);
                this.gravityFast[1] = (0.8f * this.gravity[1]) + (0.19999999f * event.values[1]);
                this.gravityFast[2] = (0.8f * this.gravity[2]) + (0.19999999f * event.values[2]);
                this.linearAcceleration[0] = event.values[0] - this.gravity[0];
                this.linearAcceleration[1] = event.values[1] - this.gravity[1];
                this.linearAcceleration[2] = event.values[2] - this.gravity[2];
            } else if (event.sensor == this.linearSensor) {
                this.linearAcceleration[0] = event.values[0];
                this.linearAcceleration[1] = event.values[1];
                this.linearAcceleration[2] = event.values[2];
            } else if (event.sensor == this.gravitySensor) {
                float[] fArr = this.gravityFast;
                float[] fArr2 = this.gravity;
                float f = event.values[0];
                fArr2[0] = f;
                fArr[0] = f;
                float[] fArr3 = this.gravityFast;
                float[] fArr4 = this.gravity;
                float f2 = event.values[1];
                fArr4[1] = f2;
                fArr3[1] = f2;
                float[] fArr5 = this.gravityFast;
                float[] fArr6 = this.gravity;
                float f3 = event.values[2];
                fArr6[2] = f3;
                fArr5[2] = f3;
            }
            if (event.sensor == this.linearSensor || event.sensor == this.gravitySensor || event.sensor == this.accelerometerSensor) {
                float val = (this.gravity[0] * this.linearAcceleration[0]) + (this.gravity[1] * this.linearAcceleration[1]) + (this.gravity[2] * this.linearAcceleration[2]);
                if (this.raisedToBack != 6) {
                    if (val > 0.0f && this.previousAccValue > 0.0f) {
                        if (val > 15.0f && this.raisedToBack == 0) {
                            if (this.raisedToTop < 6 && !this.proximityTouched) {
                                this.raisedToTop++;
                                if (this.raisedToTop == 6) {
                                    this.countLess = 0;
                                }
                            }
                        } else {
                            if (val < 15.0f) {
                                this.countLess++;
                            }
                            if (this.countLess == 10 || this.raisedToTop != 6 || this.raisedToBack != 0) {
                                this.raisedToBack = 0;
                                this.raisedToTop = 0;
                                this.countLess = 0;
                            }
                        }
                    } else if (val < 0.0f && this.previousAccValue < 0.0f) {
                        if (this.raisedToTop == 6 && val < -15.0f) {
                            if (this.raisedToBack < 6) {
                                this.raisedToBack++;
                                if (this.raisedToBack == 6) {
                                    this.raisedToTop = 0;
                                    this.countLess = 0;
                                    this.timeSinceRaise = System.currentTimeMillis();
                                }
                            }
                        } else {
                            if (val > -15.0f) {
                                this.countLess++;
                            }
                            if (this.countLess == 10 || this.raisedToTop != 6 || this.raisedToBack != 0) {
                                this.raisedToTop = 0;
                                this.raisedToBack = 0;
                                this.countLess = 0;
                            }
                        }
                    }
                }
                this.previousAccValue = val;
                this.accelerometerVertical = this.gravityFast[1] > 2.5f && Math.abs(this.gravityFast[2]) < 4.0f && Math.abs(this.gravityFast[0]) > 1.5f;
            }
            boolean wiredHeadsetOn = this.audioManager.isWiredHeadsetOn();
            boolean isVoicePlaying = AudioMessagePlayerService.isPlaying();
            if (this.raisedToBack == 6 && this.accelerometerVertical && this.proximityTouched && !wiredHeadsetOn) {
                L.d(TAG, "sensor values reached");
                boolean isRecording = AudioMessageUtils.getInstance().isRecording();
                boolean hasRecord = AudioMessageUtils.getInstance().isHasRecord();
                if (!isVoicePlaying && !isRecording && !hasRecord && !this.inputFieldHasText && this.allowStartRecord && this.raiseChat != null) {
                    if (!this.raiseToEarRecord) {
                        L.d(TAG, "start record");
                        this.raiseToEarRecord = true;
                        this.useFrontSpeaker = false;
                        AudioMessageUtils.getInstance().startRecording(this.sessionId, true);
                        screenLocker(true);
                    }
                } else if (!this.useFrontSpeaker && isVoicePlaying) {
                    L.e(TAG, "start listen");
                    this.useFrontSpeaker = true;
                    changeAudioStreamType(true);
                }
                this.raisedToBack = 0;
                this.raisedToTop = 0;
                this.countLess = 0;
            } else if (this.proximityTouched && !this.useFrontSpeaker && isVoicePlaying && !wiredHeadsetOn) {
                L.e(TAG, "start listen by proximity only");
                this.useFrontSpeaker = true;
                changeAudioStreamType(true);
            } else if (!this.proximityTouched) {
                if (this.raiseToEarRecord) {
                    L.d(TAG, "stop record");
                    AudioMessageUtils.getInstance().stopAndShowWaveform();
                    this.raiseToEarRecord = false;
                    screenLocker(false);
                } else if (this.useFrontSpeaker) {
                    L.d(TAG, "stop listen");
                    this.useFrontSpeaker = false;
                    changeAudioStreamType(this.useFrontSpeaker);
                    screenLocker(false);
                }
            }
            if (this.timeSinceRaise != 0 && this.raisedToBack == 6 && Math.abs(System.currentTimeMillis() - this.timeSinceRaise) > 1000) {
                this.raisedToBack = 0;
                this.raisedToTop = 0;
                this.countLess = 0;
                this.timeSinceRaise = 0L;
            }
        }
    }

    @Override // android.hardware.SensorEventListener
    public void onAccuracyChanged(Sensor sensor, int accuracy) {
    }

    public void startRecordingIfFromSpeaker() {
        if (this.useFrontSpeaker && this.raiseChat != null && this.allowStartRecord) {
            this.raiseToEarRecord = true;
            AudioMessageUtils.getInstance().startRecording(this.sessionId, true);
        }
    }

    private boolean isNearToSensor(float value) {
        return value < 5.0f && value != this.proximitySensor.getMaximumRange();
    }

    private void changeAudioStreamType(boolean useFrontSpeaker) {
        screenLocker(useFrontSpeaker);
        Context context = VKApplication.context;
        Intent intentPlayer = new Intent(context, AudioMessagePlayerService.class);
        intentPlayer.putExtra(NativeProtocol.WEB_DIALOG_ACTION, 6);
        intentPlayer.putExtra("front_speaker", useFrontSpeaker);
        context.startService(intentPlayer);
    }

    private void screenLocker(boolean lock) {
        if (this.proximityHasDifferentValues && this.proximityWakeLock != null && this.proximityWakeLock.isHeld() != lock) {
            if (lock) {
                this.proximityWakeLock.acquire();
            } else {
                this.proximityWakeLock.release();
            }
            if (this.raiseChat != null) {
                this.raiseChat.setVolumeControlStream(lock ? 0 : Integer.MIN_VALUE);
            }
        }
    }
}
