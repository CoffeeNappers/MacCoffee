package com.google.ads.mediation;

import com.google.android.gms.ads.internal.util.client.zzb;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;
import java.lang.reflect.Field;
import java.util.HashMap;
import java.util.Map;
@Deprecated
/* loaded from: classes.dex */
public abstract class MediationServerParameters {

    /* loaded from: classes.dex */
    public static final class MappingException extends Exception {
        public MappingException(String str) {
            super(str);
        }
    }

    @Target({ElementType.FIELD})
    @Retention(RetentionPolicy.RUNTIME)
    /* loaded from: classes.dex */
    protected @interface Parameter {
        String name();

        boolean required() default true;
    }

    public void load(Map<String, String> map) throws MappingException {
        Field[] fields;
        HashMap hashMap = new HashMap();
        for (Field field : getClass().getFields()) {
            Parameter parameter = (Parameter) field.getAnnotation(Parameter.class);
            if (parameter != null) {
                hashMap.put(parameter.name(), field);
            }
        }
        if (hashMap.isEmpty()) {
            zzb.zzdi("No server options fields detected. To suppress this message either add a field with the @Parameter annotation, or override the load() method.");
        }
        for (Map.Entry<String, String> entry : map.entrySet()) {
            Field field2 = (Field) hashMap.remove(entry.getKey());
            if (field2 != null) {
                try {
                    field2.set(this, entry.getValue());
                } catch (IllegalAccessException e) {
                    String key = entry.getKey();
                    zzb.zzdi(new StringBuilder(String.valueOf(key).length() + 49).append("Server option \"").append(key).append("\" could not be set: Illegal Access").toString());
                } catch (IllegalArgumentException e2) {
                    String key2 = entry.getKey();
                    zzb.zzdi(new StringBuilder(String.valueOf(key2).length() + 43).append("Server option \"").append(key2).append("\" could not be set: Bad Type").toString());
                }
            } else {
                String key3 = entry.getKey();
                String value = entry.getValue();
                zzb.zzdg(new StringBuilder(String.valueOf(key3).length() + 31 + String.valueOf(value).length()).append("Unexpected server option: ").append(key3).append(" = \"").append(value).append("\"").toString());
            }
        }
        StringBuilder sb = new StringBuilder();
        for (Field field3 : hashMap.values()) {
            if (((Parameter) field3.getAnnotation(Parameter.class)).required()) {
                String valueOf = String.valueOf(((Parameter) field3.getAnnotation(Parameter.class)).name());
                zzb.zzdi(valueOf.length() != 0 ? "Required server option missing: ".concat(valueOf) : new String("Required server option missing: "));
                if (sb.length() > 0) {
                    sb.append(", ");
                }
                sb.append(((Parameter) field3.getAnnotation(Parameter.class)).name());
            }
        }
        if (sb.length() > 0) {
            String valueOf2 = String.valueOf(sb.toString());
            throw new MappingException(valueOf2.length() != 0 ? "Required server option(s) missing: ".concat(valueOf2) : new String("Required server option(s) missing: "));
        }
        zzab();
    }

    protected void zzab() {
    }
}
