.class public Lcom/mopub/MopubCustomParamsFactory;
.super Ljava/lang/Object;
.source "MopubCustomParamsFactory.java"


# static fields
.field private static final EXTRA_AGE:Ljava/lang/String; = "mytarget_age"

.field private static final EXTRA_GENDER:Ljava/lang/String; = "mytarget_gender"

.field private static final EXTRA_OKID:Ljava/lang/String; = "mytarget_ok_id"

.field private static final EXTRA_VKID:Ljava/lang/String; = "mytarget_vk_id"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static getCustomParams(Ljava/util/Map;)Lcom/my/target/ads/CustomParams;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;)",
            "Lcom/my/target/ads/CustomParams;"
        }
    .end annotation

    .prologue
    .line 20
    new-instance v1, Lcom/my/target/ads/CustomParams;

    invoke-direct {v1}, Lcom/my/target/ads/CustomParams;-><init>()V

    .line 21
    const-string/jumbo v0, "mediation"

    const-string/jumbo v2, "2"

    invoke-virtual {v1, v0, v2}, Lcom/my/target/ads/CustomParams;->setCustomParam(Ljava/lang/String;Ljava/lang/String;)V

    .line 25
    :try_start_0
    const-string/jumbo v0, "mytarget_gender"

    invoke-interface {p0, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 27
    const-string/jumbo v0, "mytarget_gender"

    invoke-interface {p0, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 28
    if-ltz v0, :cond_4

    const/4 v2, 0x3

    if-ge v0, v2, :cond_4

    .line 30
    invoke-virtual {v1, v0}, Lcom/my/target/ads/CustomParams;->setGender(I)V
    :try_end_0
    .catch Ljava/lang/ClassCastException; {:try_start_0 .. :try_end_0} :catch_0

    .line 46
    :cond_0
    :goto_0
    :try_start_1
    const-string/jumbo v0, "mytarget_age"

    invoke-interface {p0, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 48
    const-string/jumbo v0, "mytarget_age"

    invoke-interface {p0, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    .line 49
    if-lez v0, :cond_5

    .line 51
    invoke-virtual {v1, v0}, Lcom/my/target/ads/CustomParams;->setAge(I)V
    :try_end_1
    .catch Ljava/lang/ClassCastException; {:try_start_1 .. :try_end_1} :catch_1

    .line 67
    :cond_1
    :goto_1
    :try_start_2
    const-string/jumbo v0, "mytarget_vk_id"

    invoke-interface {p0, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 69
    const-string/jumbo v0, "mytarget_vk_id"

    invoke-interface {p0, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 70
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_6

    .line 72
    invoke-virtual {v1, v0}, Lcom/my/target/ads/CustomParams;->setVKId(Ljava/lang/String;)V
    :try_end_2
    .catch Ljava/lang/ClassCastException; {:try_start_2 .. :try_end_2} :catch_2

    .line 88
    :cond_2
    :goto_2
    :try_start_3
    const-string/jumbo v0, "mytarget_ok_id"

    invoke-interface {p0, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    .line 90
    const-string/jumbo v0, "mytarget_ok_id"

    invoke-interface {p0, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 91
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_7

    .line 93
    invoke-virtual {v1, v0}, Lcom/my/target/ads/CustomParams;->setOkId(Ljava/lang/String;)V
    :try_end_3
    .catch Ljava/lang/ClassCastException; {:try_start_3 .. :try_end_3} :catch_3

    .line 107
    :cond_3
    :goto_3
    return-object v1

    .line 33
    :cond_4
    :try_start_4
    const-string/jumbo v0, "Wrong mopub extra value: mytarget_gender must be 0 (undefined) or 1 (male), or 2 (female)"

    invoke-static {v0}, Lcom/my/target/Tracer;->e(Ljava/lang/String;)V
    :try_end_4
    .catch Ljava/lang/ClassCastException; {:try_start_4 .. :try_end_4} :catch_0

    goto :goto_0

    .line 37
    :catch_0
    move-exception v0

    .line 39
    const-string/jumbo v2, "Wrong mopub extra value: mytarget_gender must be integer"

    .line 40
    invoke-static {v2}, Lcom/my/target/Tracer;->e(Ljava/lang/String;)V

    .line 41
    new-instance v2, Ljava/lang/StringBuilder;

    const-string/jumbo v3, "message: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/ClassCastException;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/my/target/Tracer;->d(Ljava/lang/String;)V

    goto :goto_0

    .line 54
    :cond_5
    :try_start_5
    const-string/jumbo v0, "Wrong mopub extra value: mytarget_age must be > 0"

    invoke-static {v0}, Lcom/my/target/Tracer;->e(Ljava/lang/String;)V
    :try_end_5
    .catch Ljava/lang/ClassCastException; {:try_start_5 .. :try_end_5} :catch_1

    goto :goto_1

    .line 58
    :catch_1
    move-exception v0

    .line 60
    const-string/jumbo v2, "Wrong mopub extra value: mytarget_age must be integer"

    .line 61
    invoke-static {v2}, Lcom/my/target/Tracer;->e(Ljava/lang/String;)V

    .line 62
    new-instance v2, Ljava/lang/StringBuilder;

    const-string/jumbo v3, "message: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/ClassCastException;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/my/target/Tracer;->d(Ljava/lang/String;)V

    goto/16 :goto_1

    .line 75
    :cond_6
    :try_start_6
    const-string/jumbo v0, "Wrong mopub extra value: mytarget_vk_id is empty"

    invoke-static {v0}, Lcom/my/target/Tracer;->e(Ljava/lang/String;)V
    :try_end_6
    .catch Ljava/lang/ClassCastException; {:try_start_6 .. :try_end_6} :catch_2

    goto :goto_2

    .line 79
    :catch_2
    move-exception v0

    .line 81
    const-string/jumbo v2, "Wrong mopub extra value: mytarget_vk_id must be String"

    .line 82
    invoke-static {v2}, Lcom/my/target/Tracer;->e(Ljava/lang/String;)V

    .line 83
    new-instance v2, Ljava/lang/StringBuilder;

    const-string/jumbo v3, "message: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/ClassCastException;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/my/target/Tracer;->d(Ljava/lang/String;)V

    goto/16 :goto_2

    .line 96
    :cond_7
    :try_start_7
    const-string/jumbo v0, "Wrong mopub extra value: mytarget_ok_id is empty"

    invoke-static {v0}, Lcom/my/target/Tracer;->e(Ljava/lang/String;)V
    :try_end_7
    .catch Ljava/lang/ClassCastException; {:try_start_7 .. :try_end_7} :catch_3

    goto :goto_3

    .line 100
    :catch_3
    move-exception v0

    .line 102
    const-string/jumbo v2, "Wrong mopub extra value: mytarget_ok_id must be String"

    .line 103
    invoke-static {v2}, Lcom/my/target/Tracer;->e(Ljava/lang/String;)V

    .line 104
    new-instance v2, Ljava/lang/StringBuilder;

    const-string/jumbo v3, "message: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/ClassCastException;->getMessage()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/my/target/Tracer;->d(Ljava/lang/String;)V

    goto/16 :goto_3
.end method
