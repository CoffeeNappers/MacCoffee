.class public Lcom/vk/core/util/Preference$PreferencePercent;
.super Lcom/vk/core/util/Preference$PreferenceInteger;
.source "Preference.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/core/util/Preference;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "PreferencePercent"
.end annotation


# direct methods
.method public constructor <init>(Landroid/content/SharedPreferences;Ljava/lang/String;Ljava/lang/Integer;)V
    .locals 0
    .param p1, "preferences"    # Landroid/content/SharedPreferences;
    .param p2, "key"    # Ljava/lang/String;
    .param p3, "defaultValue"    # Ljava/lang/Integer;

    .prologue
    .line 119
    invoke-direct {p0, p1, p2, p3}, Lcom/vk/core/util/Preference$PreferenceInteger;-><init>(Landroid/content/SharedPreferences;Ljava/lang/String;Ljava/lang/Integer;)V

    .line 120
    return-void
.end method


# virtual methods
.method public getAsFloat()F
    .locals 3

    .prologue
    .line 123
    invoke-virtual {p0}, Lcom/vk/core/util/Preference$PreferencePercent;->get()Ljava/lang/Integer;

    move-result-object v0

    .line 125
    .local v0, "value":Ljava/lang/Integer;
    if-nez v0, :cond_0

    const/4 v1, 0x0

    :goto_0
    return v1

    :cond_0
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v1

    int-to-float v1, v1

    const/high16 v2, 0x42c80000    # 100.0f

    div-float/2addr v1, v2

    goto :goto_0
.end method

.method public getAsFloatInverted()F
    .locals 2

    .prologue
    .line 129
    const/high16 v0, 0x3f800000    # 1.0f

    invoke-virtual {p0}, Lcom/vk/core/util/Preference$PreferencePercent;->getAsFloat()F

    move-result v1

    sub-float/2addr v0, v1

    return v0
.end method
