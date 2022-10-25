package com.vkontakte.android.statistics;

import java.lang.invoke.LambdaForm;
/* JADX INFO: Access modifiers changed from: package-private */
/* loaded from: classes.dex */
public final /* synthetic */ class StatisticBase$$Lambda$1 implements Runnable {
    private final StatisticBase arg$1;
    private final StatisticSender arg$2;

    private StatisticBase$$Lambda$1(StatisticBase statisticBase, StatisticSender statisticSender) {
        this.arg$1 = statisticBase;
        this.arg$2 = statisticSender;
    }

    public static Runnable lambdaFactory$(StatisticBase statisticBase, StatisticSender statisticSender) {
        return new StatisticBase$$Lambda$1(statisticBase, statisticSender);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.lambda$sendSync$1(this.arg$2);
    }
}
