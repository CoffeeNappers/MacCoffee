.class public Lcom/vkontakte/android/auth/configs/ProfilerConfig$DownloadPattern;
.super Ljava/lang/Object;
.source "ProfilerConfig.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/auth/configs/ProfilerConfig;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "DownloadPattern"
.end annotation


# instance fields
.field private final errorProbability:F

.field private final pattern:Ljava/util/regex/Pattern;

.field private final probability:F

.field private final type:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lorg/json/JSONObject;)V
    .locals 2
    .param p1, "obj"    # Lorg/json/JSONObject;

    .prologue
    .line 70
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 71
    const-string/jumbo v0, "type"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/auth/configs/ProfilerConfig$DownloadPattern;->type:Ljava/lang/String;

    .line 72
    const-string/jumbo v0, "pattern"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/auth/configs/ProfilerConfig$DownloadPattern;->pattern:Ljava/util/regex/Pattern;

    .line 73
    const-string/jumbo v0, "probability"

    const-string/jumbo v1, "0.0"

    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/auth/configs/ProfilerConfig$DownloadPattern;->probability:F

    .line 74
    const-string/jumbo v0, "error_probability"

    const-string/jumbo v1, "0.0"

    invoke-virtual {p1, v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/auth/configs/ProfilerConfig$DownloadPattern;->errorProbability:F

    .line 75
    return-void
.end method


# virtual methods
.method public getErrorProbability()F
    .locals 1

    .prologue
    .line 90
    iget v0, p0, Lcom/vkontakte/android/auth/configs/ProfilerConfig$DownloadPattern;->errorProbability:F

    return v0
.end method

.method public getPattern()Ljava/util/regex/Pattern;
    .locals 1

    .prologue
    .line 82
    iget-object v0, p0, Lcom/vkontakte/android/auth/configs/ProfilerConfig$DownloadPattern;->pattern:Ljava/util/regex/Pattern;

    return-object v0
.end method

.method public getProbability()F
    .locals 1

    .prologue
    .line 86
    iget v0, p0, Lcom/vkontakte/android/auth/configs/ProfilerConfig$DownloadPattern;->probability:F

    return v0
.end method

.method public getType()Ljava/lang/String;
    .locals 1

    .prologue
    .line 78
    iget-object v0, p0, Lcom/vkontakte/android/auth/configs/ProfilerConfig$DownloadPattern;->type:Ljava/lang/String;

    return-object v0
.end method

.method public toJSON()Lorg/json/JSONObject;
    .locals 6

    .prologue
    .line 95
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 96
    .local v1, "result":Lorg/json/JSONObject;
    const-string/jumbo v2, "type"

    iget-object v3, p0, Lcom/vkontakte/android/auth/configs/ProfilerConfig$DownloadPattern;->type:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 97
    const-string/jumbo v2, "pattern"

    iget-object v3, p0, Lcom/vkontakte/android/auth/configs/ProfilerConfig$DownloadPattern;->pattern:Ljava/util/regex/Pattern;

    invoke-virtual {v3}, Ljava/util/regex/Pattern;->pattern()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 98
    const-string/jumbo v2, "probability"

    iget v3, p0, Lcom/vkontakte/android/auth/configs/ProfilerConfig$DownloadPattern;->probability:F

    float-to-double v4, v3

    invoke-virtual {v1, v2, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;

    .line 99
    const-string/jumbo v2, "error_probability"

    iget v3, p0, Lcom/vkontakte/android/auth/configs/ProfilerConfig$DownloadPattern;->errorProbability:F

    float-to-double v4, v3

    invoke-virtual {v1, v2, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 103
    .end local v1    # "result":Lorg/json/JSONObject;
    :goto_0
    return-object v1

    .line 101
    :catch_0
    move-exception v0

    .line 102
    .local v0, "e":Ljava/lang/Exception;
    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    const-string/jumbo v4, "DownloadPattern"

    aput-object v4, v2, v3

    const/4 v3, 0x1

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "JSON build error "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v2}, Lcom/vkontakte/android/utils/L;->e([Ljava/lang/Object;)V

    .line 103
    const/4 v1, 0x0

    goto :goto_0
.end method
