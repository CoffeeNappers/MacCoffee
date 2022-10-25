.class public Lcom/my/target/ads/mediation/AdmobCustomParamsFactory;
.super Ljava/lang/Object;
.source "AdmobCustomParamsFactory.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getCustomParams()Lcom/my/target/ads/CustomParams;
    .locals 3

    .prologue
    .line 10
    new-instance v0, Lcom/my/target/ads/CustomParams;

    invoke-direct {v0}, Lcom/my/target/ads/CustomParams;-><init>()V

    .line 11
    const-string/jumbo v1, "mediation"

    const-string/jumbo v2, "1"

    invoke-virtual {v0, v1, v2}, Lcom/my/target/ads/CustomParams;->setCustomParam(Ljava/lang/String;Ljava/lang/String;)V

    .line 12
    return-object v0
.end method
