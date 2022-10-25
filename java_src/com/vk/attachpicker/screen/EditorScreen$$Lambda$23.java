package com.vk.attachpicker.screen;

import com.vk.attachpicker.imageeditor.FilterProducer;
import com.vk.attachpicker.imageeditor.filter.AllInOneFilter;
import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
public final /* synthetic */ class EditorScreen$$Lambda$23 implements FilterProducer {
    private final AllInOneFilter arg$1;

    private EditorScreen$$Lambda$23(AllInOneFilter allInOneFilter) {
        this.arg$1 = allInOneFilter;
    }

    public static FilterProducer lambdaFactory$(AllInOneFilter allInOneFilter) {
        return new EditorScreen$$Lambda$23(allInOneFilter);
    }

    @Override // com.vk.attachpicker.imageeditor.FilterProducer
    @LambdaForm.Hidden
    public AllInOneFilter getFilter() {
        return EditorScreen.lambda$updateFilter$22(this.arg$1);
    }
}
