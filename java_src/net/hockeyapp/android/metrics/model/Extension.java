package net.hockeyapp.android.metrics.model;

import java.io.IOException;
import java.io.Writer;
import net.hockeyapp.android.metrics.JsonHelper;
/* loaded from: classes3.dex */
public class Extension implements IJsonSerializable {
    private String ver = "1.0";

    public Extension() {
        InitializeFields();
    }

    public String getVer() {
        return this.ver;
    }

    public void setVer(String value) {
        this.ver = value;
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

    protected String serializeContent(Writer writer) throws IOException {
        if (this.ver != null) {
            writer.write("\"ver\":");
            writer.write(JsonHelper.convert(this.ver));
            return ",";
        }
        return "";
    }

    protected void InitializeFields() {
    }
}
