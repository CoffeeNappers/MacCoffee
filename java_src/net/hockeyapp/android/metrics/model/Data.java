package net.hockeyapp.android.metrics.model;

import java.io.IOException;
import java.io.Writer;
import net.hockeyapp.android.metrics.JsonHelper;
import net.hockeyapp.android.metrics.model.Domain;
/* loaded from: classes3.dex */
public class Data<TDomain extends Domain> extends Base implements ITelemetryData {
    private TDomain baseData;

    public Data() {
        InitializeFields();
        SetupAttributes();
    }

    public TDomain getBaseData() {
        return this.baseData;
    }

    public void setBaseData(TDomain value) {
        this.baseData = value;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    @Override // net.hockeyapp.android.metrics.model.Base
    public String serializeContent(Writer writer) throws IOException {
        String prefix = super.serializeContent(writer);
        writer.write(prefix + "\"baseData\":");
        JsonHelper.writeJsonSerializable(writer, this.baseData);
        return ",";
    }

    public void SetupAttributes() {
        this.Attributes.put("Description", "Data struct to contain both B and C sections.");
    }

    @Override // net.hockeyapp.android.metrics.model.Base
    protected void InitializeFields() {
        this.QualifiedName = "com.microsoft.telemetry.Data";
    }
}
