.class public abstract Lcom/vk/core/util/Preference$PreferenceValue;
.super Ljava/lang/Object;
.source "Preference.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/core/util/Preference;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "PreferenceValue"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field final mDefaultValue:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field final mKey:Ljava/lang/String;

.field final mPreferences:Landroid/content/SharedPreferences;


# direct methods
.method constructor <init>(Landroid/content/SharedPreferences;Ljava/lang/String;Ljava/lang/Object;)V
    .locals 0
    .param p1, "preferences"    # Landroid/content/SharedPreferences;
    .param p2, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/SharedPreferences;",
            "Ljava/lang/String;",
            "TT;)V"
        }
    .end annotation

    .prologue
    .line 19
    .local p0, "this":Lcom/vk/core/util/Preference$PreferenceValue;, "Lcom/vk/core/util/Preference$PreferenceValue<TT;>;"
    .local p3, "defaultValue":Ljava/lang/Object;, "TT;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    iput-object p1, p0, Lcom/vk/core/util/Preference$PreferenceValue;->mPreferences:Landroid/content/SharedPreferences;

    .line 21
    iput-object p2, p0, Lcom/vk/core/util/Preference$PreferenceValue;->mKey:Ljava/lang/String;

    .line 22
    iput-object p3, p0, Lcom/vk/core/util/Preference$PreferenceValue;->mDefaultValue:Ljava/lang/Object;

    .line 23
    return-void
.end method


# virtual methods
.method protected edit()Landroid/content/SharedPreferences$Editor;
    .locals 1

    .prologue
    .line 46
    .local p0, "this":Lcom/vk/core/util/Preference$PreferenceValue;, "Lcom/vk/core/util/Preference$PreferenceValue<TT;>;"
    iget-object v0, p0, Lcom/vk/core/util/Preference$PreferenceValue;->mPreferences:Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    return-object v0
.end method

.method public abstract get()Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation
.end method

.method public getDefaultValue()Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .prologue
    .line 30
    .local p0, "this":Lcom/vk/core/util/Preference$PreferenceValue;, "Lcom/vk/core/util/Preference$PreferenceValue<TT;>;"
    iget-object v0, p0, Lcom/vk/core/util/Preference$PreferenceValue;->mDefaultValue:Ljava/lang/Object;

    return-object v0
.end method

.method public getKey()Ljava/lang/String;
    .locals 1

    .prologue
    .line 26
    .local p0, "this":Lcom/vk/core/util/Preference$PreferenceValue;, "Lcom/vk/core/util/Preference$PreferenceValue<TT;>;"
    iget-object v0, p0, Lcom/vk/core/util/Preference$PreferenceValue;->mKey:Ljava/lang/String;

    return-object v0
.end method

.method public has()Z
    .locals 2

    .prologue
    .line 34
    .local p0, "this":Lcom/vk/core/util/Preference$PreferenceValue;, "Lcom/vk/core/util/Preference$PreferenceValue<TT;>;"
    iget-object v0, p0, Lcom/vk/core/util/Preference$PreferenceValue;->mPreferences:Landroid/content/SharedPreferences;

    iget-object v1, p0, Lcom/vk/core/util/Preference$PreferenceValue;->mKey:Ljava/lang/String;

    invoke-interface {v0, v1}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public remove()V
    .locals 2

    .prologue
    .line 38
    .local p0, "this":Lcom/vk/core/util/Preference$PreferenceValue;, "Lcom/vk/core/util/Preference$PreferenceValue<TT;>;"
    invoke-virtual {p0}, Lcom/vk/core/util/Preference$PreferenceValue;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    iget-object v1, p0, Lcom/vk/core/util/Preference$PreferenceValue;->mKey:Ljava/lang/String;

    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 39
    return-void
.end method

.method public abstract set(Ljava/lang/Object;)V
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation
.end method
