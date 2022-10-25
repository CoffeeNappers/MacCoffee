.class public Lcom/vk/core/util/Preference$PreferenceLongArray;
.super Lcom/vk/core/util/Preference$PreferenceValue;
.source "Preference.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/core/util/Preference;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "PreferenceLongArray"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vk/core/util/Preference$PreferenceValue",
        "<[",
        "Ljava/lang/Long;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Landroid/content/SharedPreferences;Ljava/lang/String;[Ljava/lang/Long;)V
    .locals 0
    .param p1, "preferences"    # Landroid/content/SharedPreferences;
    .param p2, "key"    # Ljava/lang/String;
    .param p3, "defaultValue"    # [Ljava/lang/Long;

    .prologue
    .line 89
    invoke-direct {p0, p1, p2, p3}, Lcom/vk/core/util/Preference$PreferenceValue;-><init>(Landroid/content/SharedPreferences;Ljava/lang/String;Ljava/lang/Object;)V

    .line 90
    return-void
.end method


# virtual methods
.method public bridge synthetic get()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 86
    invoke-virtual {p0}, Lcom/vk/core/util/Preference$PreferenceLongArray;->get()[Ljava/lang/Long;

    move-result-object v0

    return-object v0
.end method

.method public get()[Ljava/lang/Long;
    .locals 7

    .prologue
    .line 94
    iget-object v4, p0, Lcom/vk/core/util/Preference$PreferenceLongArray;->mPreferences:Landroid/content/SharedPreferences;

    iget-object v5, p0, Lcom/vk/core/util/Preference$PreferenceLongArray;->mKey:Ljava/lang/String;

    const-string/jumbo v6, ""

    invoke-interface {v4, v5, v6}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 95
    .local v2, "s":Ljava/lang/String;
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 96
    iget-object v4, p0, Lcom/vk/core/util/Preference$PreferenceLongArray;->mDefaultValue:Ljava/lang/Object;

    check-cast v4, [Ljava/lang/Long;

    .line 101
    :goto_0
    return-object v4

    .line 98
    :cond_0
    const-string/jumbo v4, ","

    invoke-virtual {v2, v4}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v3

    .line 99
    .local v3, "ss":[Ljava/lang/String;
    array-length v4, v3

    new-array v1, v4, [Ljava/lang/Long;

    .line 100
    .local v1, "longs":[Ljava/lang/Long;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    array-length v4, v3

    if-ge v0, v4, :cond_1

    aget-object v4, v3, v0

    invoke-static {v4}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v4

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    aput-object v4, v1, v0

    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_1
    move-object v4, v1

    .line 101
    goto :goto_0
.end method

.method public bridge synthetic set(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 86
    check-cast p1, [Ljava/lang/Long;

    invoke-virtual {p0, p1}, Lcom/vk/core/util/Preference$PreferenceLongArray;->set([Ljava/lang/Long;)V

    return-void
.end method

.method public set([Ljava/lang/Long;)V
    .locals 3
    .param p1, "value"    # [Ljava/lang/Long;

    .prologue
    .line 107
    if-eqz p1, :cond_0

    array-length v0, p1

    if-nez v0, :cond_1

    .line 108
    :cond_0
    invoke-virtual {p0}, Lcom/vk/core/util/Preference$PreferenceLongArray;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    iget-object v1, p0, Lcom/vk/core/util/Preference$PreferenceLongArray;->mKey:Ljava/lang/String;

    const-string/jumbo v2, ""

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 112
    :goto_0
    return-void

    .line 110
    :cond_1
    invoke-virtual {p0}, Lcom/vk/core/util/Preference$PreferenceLongArray;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    iget-object v1, p0, Lcom/vk/core/util/Preference$PreferenceLongArray;->mKey:Ljava/lang/String;

    const-string/jumbo v2, ","

    invoke-static {v2, p1}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    goto :goto_0
.end method
