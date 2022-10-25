package com.google.android.gms.internal;

import com.facebook.internal.AnalyticsEvents;
import com.google.android.gms.internal.zzaiy;
import com.google.android.gms.internal.zzalx;
import com.vk.media.camera.CameraUtilsEffects;
import java.lang.Thread;
import java.lang.reflect.InvocationTargetException;
import java.util.List;
import java.util.concurrent.ScheduledExecutorService;
import java.util.concurrent.ThreadFactory;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes2.dex */
public enum zzajo implements zzajr {
    INSTANCE;
    
    static ThreadFactory bdy;
    static final zzakc bdz = new zzakc() { // from class: com.google.android.gms.internal.zzajo.1
        @Override // com.google.android.gms.internal.zzakc
        public void zza(Thread thread, String str) {
        }

        @Override // com.google.android.gms.internal.zzakc
        public void zza(Thread thread, Thread.UncaughtExceptionHandler uncaughtExceptionHandler) {
            thread.setUncaughtExceptionHandler(uncaughtExceptionHandler);
        }

        @Override // com.google.android.gms.internal.zzakc
        public void zza(Thread thread, boolean z) {
        }
    };

    public static boolean isActive() {
        return zzcve() != null;
    }

    private static ThreadFactory zzcve() {
        if (bdy == null) {
            try {
                Class<?> cls = Class.forName("com.google.appengine.api.ThreadManager");
                if (cls != null) {
                    bdy = (ThreadFactory) cls.getMethod("backgroundThreadFactory", new Class[0]).invoke(null, new Object[0]);
                }
            } catch (ClassNotFoundException e) {
                return null;
            } catch (IllegalAccessException e2) {
                throw new RuntimeException(e2);
            } catch (NoSuchMethodException e3) {
                throw new RuntimeException(e3);
            } catch (InvocationTargetException e4) {
                throw new RuntimeException(e4);
            }
        }
        return bdy;
    }

    public void initialize() {
        zzamv.zza(bdy, new zzamu() { // from class: com.google.android.gms.internal.zzajo.2
            @Override // com.google.android.gms.internal.zzamu
            public void zza(Thread thread, String str) {
                zzajo.bdz.zza(thread, str);
            }
        });
    }

    @Override // com.google.android.gms.internal.zzajr
    public zzaiy zza(zzajj zzajjVar, zzaiu zzaiuVar, zzaiw zzaiwVar, zzaiy.zza zzaVar) {
        return new zzaiz(zzajjVar.zzcup(), zzaiwVar, zzaVar);
    }

    @Override // com.google.android.gms.internal.zzajr
    public zzajf zza(ScheduledExecutorService scheduledExecutorService) {
        throw new RuntimeException("Authentication is not implemented yet");
    }

    @Override // com.google.android.gms.internal.zzajr
    public zzajn zza(zzajj zzajjVar) {
        return new zzakd(zzcve(), bdz);
    }

    @Override // com.google.android.gms.internal.zzajr
    public zzaku zza(zzajj zzajjVar, String str) {
        return null;
    }

    @Override // com.google.android.gms.internal.zzajr
    public zzalx zza(zzajj zzajjVar, zzalx.zza zzaVar, List<String> list) {
        return new zzalv(zzaVar, list);
    }

    @Override // com.google.android.gms.internal.zzajr
    public zzajv zzb(zzajj zzajjVar) {
        final zzalw zzss = zzajjVar.zzss("RunLoop");
        return new zzanh() { // from class: com.google.android.gms.internal.zzajo.3
            @Override // com.google.android.gms.internal.zzanh
            protected ThreadFactory getThreadFactory() {
                return zzajo.bdy;
            }

            @Override // com.google.android.gms.internal.zzanh
            protected zzakc zzcvf() {
                return zzajo.bdz;
            }

            @Override // com.google.android.gms.internal.zzanh
            public void zzj(Throwable th) {
                zzss.zzd(zzanh.zzl(th), th);
            }
        };
    }

    @Override // com.google.android.gms.internal.zzajr
    public String zzc(zzajj zzajjVar) {
        String property = System.getProperty("java.specification.version", AnalyticsEvents.PARAMETER_DIALOG_OUTCOME_VALUE_UNKNOWN);
        return new StringBuilder(String.valueOf(property).length() + 1 + String.valueOf("AppEngine").length()).append(property).append(CameraUtilsEffects.FILE_DELIM).append("AppEngine").toString();
    }
}
