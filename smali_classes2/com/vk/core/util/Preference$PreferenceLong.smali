.class public Lcom/vk/core/util/Preference$PreferenceLong;
.super Lcom/vk/core/util/Preference$PreferenceValue;
.source "Preference.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/core/util/Preference;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "PreferenceLong"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vk/core/util/Preference$PreferenceValue",
        "<",
        "Ljava/lang/Long;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Landroid/content/SharedPreferences;Ljava/lang/String;Ljava/lang/Long;)V
    .locals 0
    .param p1, "preferences"    # Landroid/content/SharedPreferences;
    .param p2, "key"    # Ljava/lang/String;
    .param p3, "defaultValue"    # Ljava/lang/Long;

    .prologue
    .line 137
    invoke-direct {p0, p1, p2, p3}, Lcom/vk/core/util/Preference$PreferenceValue;-><init>(Landroid/content/SharedPreferences;Ljava/lang/String;Ljava/lang/Object;)V

    .line 138
    return-void
.end method


# virtual methods
.method public add(I)V
    .locals 4
    .param p1, "value"    # I

    .prologue
    .line 151
    invoke-virtual {p0}, Lcom/vk/core/util/Preference$PreferenceLong;->get()Ljava/lang/Long;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    int-to-long v2, p1

    add-long/2addr v0, v2

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/vk/core/util/Preference$PreferenceLong;->set(Ljava/lang/Long;)V

    .line 152
    return-void
.end method

.method public get()Ljava/lang/Long;
    .locals 6

    .prologue
    .line 142
    iget-object v1, p0, Lcom/vk/core/util/Preference$PreferenceLong;->mPreferences:Landroid/content/SharedPreferences;

    iget-object v2, p0, Lcom/vk/core/util/Preference$PreferenceLong;->mKey:Ljava/lang/String;

    iget-object v0, p0, Lcom/vk/core/util/Preference$PreferenceLong;->mDefaultValue:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Long;

    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    invoke-interface {v1, v2, v4, v5}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic get()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 133
    invoke-virtual {p0}, Lcom/vk/core/util/Preference$PreferenceLong;->get()Ljava/lang/Long;

    move-result-object v0

    return-object v0
.end method

.method public set(Ljava/lang/Long;)V
    .locals 4
    .param p1, "value"    # Ljava/lang/Long;

    .prologue
    .line 147
    invoke-virtual {p0}, Lcom/vk/core/util/Preference$PreferenceLong;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    iget-object v1, p0, Lcom/vk/core/util/Preference$PreferenceLong;->mKey:Ljava/lang/String;

    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v2

    invoke-interface {v0, v1, v2, v3}, Landroid/content/SharedPreferences$Editor;->putLong(Ljava/lang/String;J)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 148
    return-void
.end method

.method public bridge synthetic set(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 133
    check-cast p1, Ljava/lang/Long;

    invoke-virtual {p0, p1}, Lcom/vk/core/util/Preference$PreferenceLong;->set(Ljava/lang/Long;)V

    return-void
.end method
