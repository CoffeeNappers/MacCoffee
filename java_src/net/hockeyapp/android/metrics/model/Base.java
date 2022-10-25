package net.hockeyapp.android.metrics.model;

import java.io.IOException;
import java.io.Writer;
import java.util.LinkedHashMap;
import net.hockeyapp.android.metrics.JsonHelper;
/* loaded from: classes3.dex */
public class Base implements IJsonSerializable {
    public LinkedHashMap<String, String> Attributes;
    public String QualifiedName;
    private String baseType;

    public Base() {
        InitializeFields();
        this.Attributes = new LinkedHashMap<>();
    }

    public String getBaseType() {
        return this.baseType;
    }

    public void setBaseType(String value) {
        this.baseType = value;
    }

    @Override // net.hockeyapp.android.metrics.model.IJsonSerializable
    public void serialize(Writer writer) throws IOException {
        if (writer == null) {
            throw new IllegalArgumentException("writer");
        }
        writer.write(123);
        serializeContent(writer);
        writer.write(125);
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public String serializeContent(Writer writer) throws IOException {
        if (this.baseType != null) {
            writer.write("\"baseType\":");
            writer.write(JsonHelper.convert(this.baseType));
            return ",";
        }
        return "";
    }

    protected void InitializeFields() {
    }
}
