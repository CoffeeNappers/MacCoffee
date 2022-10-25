.class public Lcom/vk/core/util/Preference$PreferenceEnum;
.super Lcom/vk/core/util/Preference$PreferenceValue;
.source "Preference.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/core/util/Preference;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "PreferenceEnum"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Enum",
        "<TT;>;>",
        "Lcom/vk/core/util/Preference$PreferenceValue",
        "<TT;>;"
    }
.end annotation


# instance fields
.field private final mClass:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class",
            "<TT;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/SharedPreferences;Ljava/lang/String;Ljava/lang/Enum;Ljava/lang/Class;)V
    .locals 0
    .param p1, "preferences"    # Landroid/content/SharedPreferences;
    .param p2, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/SharedPreferences;",
            "Ljava/lang/String;",
            "TT;",
            "Ljava/lang/Class",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 228
    .local p0, "this":Lcom/vk/core/util/Preference$PreferenceEnum;, "Lcom/vk/core/util/Preference$PreferenceEnum<TT;>;"
    .local p3, "defaultValue":Ljava/lang/Enum;, "TT;"
    .local p4, "cls":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    invoke-direct {p0, p1, p2, p3}, Lcom/vk/core/util/Preference$PreferenceValue;-><init>(Landroid/content/SharedPreferences;Ljava/lang/String;Ljava/lang/Object;)V

    .line 230
    iput-object p4, p0, Lcom/vk/core/util/Preference$PreferenceEnum;->mClass:Ljava/lang/Class;

    .line 231
    return-void
.end method


# virtual methods
.method public get()Ljava/lang/Enum;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .prologue
    .line 235
    .local p0, "this":Lcom/vk/core/util/Preference$PreferenceEnum;, "Lcom/vk/core/util/Preference$PreferenceEnum<TT;>;"
    iget-object v1, p0, Lcom/vk/core/util/Preference$PreferenceEnum;->mPreferences:Landroid/content/SharedPreferences;

    iget-object v2, p0, Lcom/vk/core/util/Preference$PreferenceEnum;->mKey:Ljava/lang/String;

    invoke-interface {v1, v2}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 236
    iget-object v1, p0, Lcom/vk/core/util/Preference$PreferenceEnum;->mDefaultValue:Ljava/lang/Object;

    check-cast v1, Ljava/lang/Enum;

    .line 242
    :goto_0
    return-object v1

    .line 239
    :cond_0
    :try_start_0
    iget-object v1, p0, Lcom/vk/core/util/Preference$PreferenceEnum;->mClass:Ljava/lang/Class;

    iget-object v2, p0, Lcom/vk/core/util/Preference$PreferenceEnum;->mPreferences:Landroid/content/SharedPreferences;

    iget-object v3, p0, Lcom/vk/core/util/Preference$PreferenceEnum;->mKey:Ljava/lang/String;

    const/4 v4, 0x0

    invoke-interface {v2, v3, v4}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    goto :goto_0

    .line 240
    :catch_0
    move-exception v0

    .line 241
    .local v0, "e":Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 242
    iget-object v1, p0, Lcom/vk/core/util/Preference$PreferenceEnum;->mDefaultValue:Ljava/lang/Object;

    check-cast v1, Ljava/lang/Enum;

    goto :goto_0
.end method

.method public bridge synthetic get()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 222
    .local p0, "this":Lcom/vk/core/util/Preference$PreferenceEnum;, "Lcom/vk/core/util/Preference$PreferenceEnum<TT;>;"
    invoke-virtual {p0}, Lcom/vk/core/util/Preference$PreferenceEnum;->get()Ljava/lang/Enum;

    move-result-object v0

    return-object v0
.end method

.method public set(Ljava/lang/Enum;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 248
    .local p0, "this":Lcom/vk/core/util/Preference$PreferenceEnum;, "Lcom/vk/core/util/Preference$PreferenceEnum<TT;>;"
    .local p1, "value":Ljava/lang/Enum;, "TT;"
    invoke-virtual {p0}, Lcom/vk/core/util/Preference$PreferenceEnum;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    iget-object v1, p0, Lcom/vk/core/util/Preference$PreferenceEnum;->mKey:Ljava/lang/String;

    invoke-virtual {p1}, Ljava/lang/Enum;->name()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 249
    return-void
.end method

.method public bridge synthetic set(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 222
    .local p0, "this":Lcom/vk/core/util/Preference$PreferenceEnum;, "Lcom/vk/core/util/Preference$PreferenceEnum<TT;>;"
    check-cast p1, Ljava/lang/Enum;

    invoke-virtual {p0, p1}, Lcom/vk/core/util/Preference$PreferenceEnum;->set(Ljava/lang/Enum;)V

    return-void
.end method
