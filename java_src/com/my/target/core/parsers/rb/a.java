package com.my.target.core.parsers.rb;

import android.graphics.Color;
import android.text.TextUtils;
import com.my.target.core.models.sections.h;
import com.my.target.core.models.sections.i;
import com.my.target.core.models.sections.j;
import com.my.target.core.models.sections.k;
import com.my.target.core.parsers.a;
import com.my.target.nativeads.models.ImageData;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
/* compiled from: RBAbstractParser.java */
/* loaded from: classes2.dex */
public final class a {
    /* JADX INFO: Access modifiers changed from: package-private */
    public static String a(JSONObject jSONObject, String str, a.C0235a c0235a, String str2, boolean z) {
        if (jSONObject.has(str)) {
            try {
                str2 = jSONObject.getString(str);
                if (TextUtils.isEmpty(str2)) {
                    if (!z) {
                        return null;
                    }
                    com.my.target.core.parsers.a.a("Empty string required field '" + str + "', Operation: " + c0235a.d + ", Unit: " + c0235a.e, c0235a, null, "Required field absence");
                    return str2;
                }
                return str2;
            } catch (JSONException e) {
                String str3 = "JSON Exception in field " + str + ", Operation: " + c0235a.d + ", Unit: " + c0235a.e;
                if (z) {
                    com.my.target.core.parsers.a.a(str3, c0235a, e, "JSONException");
                    return str2;
                }
                return str2;
            }
        } else if (z) {
            com.my.target.core.parsers.a.a("No required field '" + str + "', Operation: " + c0235a.d + ", Unit: " + c0235a.e, c0235a, null, "Required field absence");
            return str2;
        } else {
            return str2;
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static JSONObject a(JSONObject jSONObject, String str, a.C0235a c0235a, boolean z) {
        if (jSONObject.has(str)) {
            try {
                return jSONObject.getJSONObject(str);
            } catch (JSONException e) {
                String str2 = e.getMessage() + "  field: " + str + ", Operation: " + c0235a.d + ", Unit: " + c0235a.e;
                if (!z) {
                    return null;
                }
                com.my.target.core.parsers.a.a(str2, c0235a, e, "JSONException");
                return null;
            }
        } else if (!z) {
            return null;
        } else {
            com.my.target.core.parsers.a.a("Didn't found required field '" + str + "', Operation: " + c0235a.d + ", Unit: " + c0235a.e, c0235a, null, "Required field absence");
            return null;
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static int a(JSONObject jSONObject, String str, a.C0235a c0235a, int i, boolean z) {
        if (jSONObject.has(str)) {
            try {
                int i2 = jSONObject.getInt(str);
                if (i2 >= 0) {
                    return i2;
                }
                com.my.target.core.parsers.a.a("Parsing negative integer in field '" + str + "', Operation: " + c0235a.d + ", Unit: " + c0235a.e, c0235a, "JSONException");
                return i;
            } catch (JSONException e) {
                String str2 = "JSON Exception in field '" + str + "', Operation: " + c0235a.d + ", Unit: " + c0235a.e;
                if (z) {
                    com.my.target.core.parsers.a.a(str2, c0235a, e, "JSONException");
                    return i;
                }
                return i;
            }
        } else if (z) {
            com.my.target.core.parsers.a.a("Didn't found required field '" + str + "', Operation: " + c0235a.d + ", Unit: " + c0235a.e, c0235a, null, "Required field absence");
            return i;
        } else {
            return i;
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static double a(JSONObject jSONObject, String str, a.C0235a c0235a, double d, boolean z) {
        if (jSONObject.has(str)) {
            try {
                double d2 = jSONObject.getDouble(str);
                if (d2 >= 0.0d) {
                    return d2;
                }
                com.my.target.core.parsers.a.a("Parsing negative double in field '" + str + "', Operation: " + c0235a.d + ", Unit: " + c0235a.e, c0235a, "JSONException");
                return d;
            } catch (JSONException e) {
                String str2 = "JSON Exception in field '" + str + "', Operation: " + c0235a.d + ", Unit: " + c0235a.e;
                if (z) {
                    com.my.target.core.parsers.a.a(str2, c0235a, e, "JSONException");
                    return d;
                }
                return d;
            }
        } else if (z) {
            com.my.target.core.parsers.a.a("Didn't found required field '" + str + "', Operation: " + c0235a.d + ", Unit: " + c0235a.e, c0235a, null, "Required field absence");
            return d;
        } else {
            return d;
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static boolean b(JSONObject jSONObject, String str, a.C0235a c0235a, boolean z) {
        if (jSONObject.has(str)) {
            try {
                return jSONObject.getBoolean(str);
            } catch (JSONException e) {
                new StringBuilder("JSON Exception in field '").append(str).append("', Operation: ").append(c0235a.d).append(", Unit: ").append(c0235a.e);
                return z;
            }
        }
        return z;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static JSONArray a(JSONObject jSONObject, String str, a.C0235a c0235a) {
        if (jSONObject.has(str)) {
            try {
                return jSONObject.getJSONArray(str);
            } catch (JSONException e) {
                new StringBuilder("JSON Exception in field '").append(str).append("', Operation: ").append(c0235a.d).append(", Unit: ").append(c0235a.e);
                return null;
            }
        }
        return null;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static int a(JSONObject jSONObject, String str, a.C0235a c0235a, int i) {
        String str2 = "";
        try {
            str2 = a(jSONObject, str, c0235a, "", false);
            if (!TextUtils.isEmpty(str2)) {
                return Color.parseColor(str2);
            }
            return i;
        } catch (Exception e) {
            com.my.target.core.parsers.a.a("Unable to parse color: '" + str + "', value: " + str2 + ", Operation: " + c0235a.d + ", Unit: " + c0235a.e, c0235a, e, "Color parse error");
            return i;
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static h a(i iVar, String str, a.C0235a c0235a) {
        try {
            return (h) iVar;
        } catch (Exception e) {
            com.my.target.core.parsers.a.a("Unable to cast to native section field '" + str + "', Operation: " + c0235a.d + ", Unit: " + c0235a.e, c0235a, e, "Class cast exception");
            return null;
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static com.my.target.core.models.sections.f b(i iVar, String str, a.C0235a c0235a) {
        try {
            return (com.my.target.core.models.sections.f) iVar;
        } catch (Exception e) {
            com.my.target.core.parsers.a.a("Unable to cast to instream section field '" + str + "', Operation: " + c0235a.d + ", Unit: " + c0235a.e, c0235a, e, "Class cast exception");
            return null;
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static j c(i iVar, String str, a.C0235a c0235a) {
        try {
            return (j) iVar;
        } catch (Exception e) {
            com.my.target.core.parsers.a.a("Unable to cast to standard section field '" + str + "', Operation: " + c0235a.d + ", Unit: " + c0235a.e, c0235a, e, "Class cast exception");
            return null;
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static k d(i iVar, String str, a.C0235a c0235a) {
        try {
            return (k) iVar;
        } catch (Exception e) {
            com.my.target.core.parsers.a.a("Unable to cast to standard section field '" + str + "', Operation: " + c0235a.d + ", Unit: " + c0235a.e, c0235a, e, "Class cast exception");
            return null;
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static com.my.target.core.models.sections.d e(i iVar, String str, a.C0235a c0235a) {
        try {
            return (com.my.target.core.models.sections.d) iVar;
        } catch (Exception e) {
            com.my.target.core.parsers.a.a("Unable to cast to standard section field '" + str + "', Operation: " + c0235a.d + ", Unit: " + c0235a.e, c0235a, e, "Class cast exception");
            return null;
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static com.my.target.core.models.sections.e f(i iVar, String str, a.C0235a c0235a) {
        try {
            return (com.my.target.core.models.sections.e) iVar;
        } catch (Exception e) {
            com.my.target.core.parsers.a.a("Unable to cast to standard section field '" + str + "', Operation: " + c0235a.d + ", Unit: " + c0235a.e, c0235a, e, "Class cast exception");
            return null;
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static com.my.target.core.models.sections.b g(i iVar, String str, a.C0235a c0235a) {
        try {
            return (com.my.target.core.models.sections.b) iVar;
        } catch (Exception e) {
            com.my.target.core.parsers.a.a("Unable to cast to standard section field '" + str + "', Operation: " + c0235a.d + ", Unit: " + c0235a.e, c0235a, e, "Class cast exception");
            return null;
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static JSONObject a(int i, JSONArray jSONArray, String str, a.C0235a c0235a) {
        try {
            return jSONArray.getJSONObject(i);
        } catch (JSONException e) {
            com.my.target.core.parsers.a.a("Unable to get JSONObject from JSONArray '" + str + "'", c0235a, "JSONException");
            return null;
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static String b(int i, JSONArray jSONArray, String str, a.C0235a c0235a) {
        try {
            return jSONArray.getString(i);
        } catch (JSONException e) {
            com.my.target.core.parsers.a.a("Unable to get String from JSONArray " + str, c0235a, "JSONException");
            return null;
        }
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static float b(JSONObject jSONObject, String str, a.C0235a c0235a) {
        float a = (float) a(jSONObject, str, c0235a, 0.0d, false);
        if (a > 5.0d || a < 0.0d) {
            com.my.target.core.parsers.a.a("Native Banner parse error: rating '" + a + "' is out of bounds [0, 5]", c0235a, "Out of bounds rating");
        }
        return a;
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static ImageData a(JSONObject jSONObject, String str, String str2, String str3, a.C0235a c0235a) {
        String a = a(jSONObject, str, c0235a, "", false);
        int a2 = a(jSONObject, str2, c0235a, 0, false);
        int a3 = a(jSONObject, str3, c0235a, 0, false);
        if (TextUtils.isEmpty(a)) {
            return null;
        }
        return new ImageData(a, a3, a2);
    }

    /* JADX INFO: Access modifiers changed from: package-private */
    public static ImageData c(JSONObject jSONObject, String str, a.C0235a c0235a) {
        String a = a(jSONObject, str, c0235a, "", false);
        if (TextUtils.isEmpty(a)) {
            return null;
        }
        return new ImageData(a);
    }
}
