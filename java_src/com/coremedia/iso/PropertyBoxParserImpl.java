package com.coremedia.iso;

import com.coremedia.iso.boxes.Box;
import com.coremedia.iso.boxes.UserBox;
import com.vkontakte.android.data.ServerKeys;
import java.io.IOException;
import java.io.InputStream;
import java.lang.reflect.InvocationTargetException;
import java.net.URL;
import java.util.Enumeration;
import java.util.Properties;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
/* loaded from: classes.dex */
public class PropertyBoxParserImpl extends AbstractBoxParser {
    static String[] EMPTY_STRING_ARRAY = new String[0];
    Properties mapping;
    Pattern constuctorPattern = Pattern.compile("(.*)\\((.*?)\\)");
    StringBuilder buildLookupStrings = new StringBuilder();
    ThreadLocal<String> clazzName = new ThreadLocal<>();
    ThreadLocal<String[]> param = new ThreadLocal<>();

    public PropertyBoxParserImpl(String... customProperties) {
        InputStream is = getClass().getResourceAsStream("/isoparser-default.properties");
        try {
            this.mapping = new Properties();
            try {
                this.mapping.load(is);
                ClassLoader cl = Thread.currentThread().getContextClassLoader();
                Enumeration<URL> enumeration = (cl == null ? ClassLoader.getSystemClassLoader() : cl).getResources("isoparser-custom.properties");
                while (enumeration.hasMoreElements()) {
                    URL url = enumeration.nextElement();
                    InputStream customIS = url.openStream();
                    try {
                        this.mapping.load(customIS);
                    } finally {
                        customIS.close();
                    }
                }
                for (String customProperty : customProperties) {
                    this.mapping.load(getClass().getResourceAsStream(customProperty));
                }
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        } finally {
            try {
                is.close();
            } catch (IOException e2) {
                e2.printStackTrace();
            }
        }
    }

    public PropertyBoxParserImpl(Properties mapping) {
        this.mapping = mapping;
    }

    @Override // com.coremedia.iso.AbstractBoxParser
    public Box createBox(String type, byte[] userType, String parent) {
        invoke(type, userType, parent);
        String[] param = this.param.get();
        try {
            Class<?> cls = Class.forName(this.clazzName.get());
            if (param.length > 0) {
                Class[] constructorArgsClazz = new Class[param.length];
                Object[] constructorArgs = new Object[param.length];
                for (int i = 0; i < param.length; i++) {
                    if ("userType".equals(param[i])) {
                        constructorArgs[i] = userType;
                        constructorArgsClazz[i] = byte[].class;
                    } else if (ServerKeys.TYPE.equals(param[i])) {
                        constructorArgs[i] = type;
                        constructorArgsClazz[i] = String.class;
                    } else if ("parent".equals(param[i])) {
                        constructorArgs[i] = parent;
                        constructorArgsClazz[i] = String.class;
                    } else {
                        throw new InternalError("No such param: " + param[i]);
                    }
                }
                return (Box) cls.getConstructor(constructorArgsClazz).newInstance(constructorArgs);
            }
            return (Box) cls.newInstance();
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        } catch (IllegalAccessException e2) {
            throw new RuntimeException(e2);
        } catch (InstantiationException e3) {
            throw new RuntimeException(e3);
        } catch (NoSuchMethodException e4) {
            throw new RuntimeException(e4);
        } catch (InvocationTargetException e5) {
            throw new RuntimeException(e5);
        }
    }

    public void invoke(String type, byte[] userType, String parent) {
        String constructor;
        if (userType != null) {
            if (!UserBox.TYPE.equals(type)) {
                throw new RuntimeException("we have a userType but no uuid box type. Something's wrong");
            }
            constructor = this.mapping.getProperty("uuid[" + Hex.encodeHex(userType).toUpperCase() + "]");
            if (constructor == null) {
                constructor = this.mapping.getProperty(String.valueOf(parent) + "-uuid[" + Hex.encodeHex(userType).toUpperCase() + "]");
            }
            if (constructor == null) {
                constructor = this.mapping.getProperty(UserBox.TYPE);
            }
        } else {
            constructor = this.mapping.getProperty(type);
            if (constructor == null) {
                String lookup = this.buildLookupStrings.append(parent).append('-').append(type).toString();
                this.buildLookupStrings.setLength(0);
                constructor = this.mapping.getProperty(lookup);
            }
        }
        if (constructor == null) {
            constructor = this.mapping.getProperty("default");
        }
        if (constructor == null) {
            throw new RuntimeException("No box object found for " + type);
        }
        if (!constructor.endsWith(")")) {
            this.param.set(EMPTY_STRING_ARRAY);
            this.clazzName.set(constructor);
            return;
        }
        Matcher m = this.constuctorPattern.matcher(constructor);
        boolean matches = m.matches();
        if (!matches) {
            throw new RuntimeException("Cannot work with that constructor: " + constructor);
        }
        this.clazzName.set(m.group(1));
        if (m.group(2).length() == 0) {
            this.param.set(EMPTY_STRING_ARRAY);
        } else {
            this.param.set(m.group(2).length() > 0 ? m.group(2).split(",") : new String[0]);
        }
    }
}
