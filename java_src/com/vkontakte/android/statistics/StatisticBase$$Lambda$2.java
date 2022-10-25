package com.vkontakte.android.statistics;

import java.lang.invoke.LambdaForm;
/* loaded from: classes.dex */
final /* synthetic */ class StatisticBase$$Lambda$2 implements Runnable {
    private final StatisticBase arg$1;
    private final StatisticSender arg$2;

    private StatisticBase$$Lambda$2(StatisticBase statisticBase, StatisticSender statisticSender) {
        this.arg$1 = statisticBase;
        this.arg$2 = statisticSender;
    }

    public static Runnable lambdaFactory$(StatisticBase statisticBase, StatisticSender statisticSender) {
        return new StatisticBase$$Lambda$2(statisticBase, statisticSender);
    }

    @Override // java.lang.Runnable
    @LambdaForm.Hidden
    public void run() {
        this.arg$1.lambda$null$0(this.arg$2);
    }
}
