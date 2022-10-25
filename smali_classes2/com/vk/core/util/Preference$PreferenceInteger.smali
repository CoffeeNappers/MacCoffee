.class public Lcom/vk/core/util/Preference$PreferenceInteger;
.super Lcom/vk/core/util/Preference$PreferenceValue;
.source "Preference.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/core/util/Preference;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "PreferenceInteger"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vk/core/util/Preference$PreferenceValue",
        "<",
        "Ljava/lang/Integer;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>(Landroid/content/SharedPreferences;Ljava/lang/String;Ljava/lang/Integer;)V
    .locals 0
    .param p1, "preferences"    # Landroid/content/SharedPreferences;
    .param p2, "key"    # Ljava/lang/String;
    .param p3, "defaultValue"    # Ljava/lang/Integer;

    .prologue
    .line 159
    invoke-direct {p0, p1, p2, p3}, Lcom/vk/core/util/Preference$PreferenceValue;-><init>(Landroid/content/SharedPreferences;Ljava/lang/String;Ljava/lang/Object;)V

    .line 160
    return-void
.end method


# virtual methods
.method public add(I)V
    .locals 1
    .param p1, "value"    # I

    .prologue
    .line 173
    invoke-virtual {p0}, Lcom/vk/core/util/Preference$PreferenceInteger;->get()Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    add-int/2addr v0, p1

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/vk/core/util/Preference$PreferenceInteger;->set(Ljava/lang/Integer;)V

    .line 174
    return-void
.end method

.method public get()Ljava/lang/Integer;
    .locals 3

    .prologue
    .line 164
    iget-object v1, p0, Lcom/vk/core/util/Preference$PreferenceInteger;->mPreferences:Landroid/content/SharedPreferences;

    iget-object v2, p0, Lcom/vk/core/util/Preference$PreferenceInteger;->mKey:Ljava/lang/String;

    iget-object v0, p0, Lcom/vk/core/util/Preference$PreferenceInteger;->mDefaultValue:Ljava/lang/Object;

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-interface {v1, v2, v0}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method

.method public bridge synthetic get()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 155
    invoke-virtual {p0}, Lcom/vk/core/util/Preference$PreferenceInteger;->get()Ljava/lang/Integer;

    move-result-object v0

    return-object v0
.end method

.method public set(Ljava/lang/Integer;)V
    .locals 3
    .param p1, "value"    # Ljava/lang/Integer;

    .prologue
    .line 169
    invoke-virtual {p0}, Lcom/vk/core/util/Preference$PreferenceInteger;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    iget-object v1, p0, Lcom/vk/core/util/Preference$PreferenceInteger;->mKey:Ljava/lang/String;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 170
    return-void
.end method

.method public bridge synthetic set(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 155
    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p0, p1}, Lcom/vk/core/util/Preference$PreferenceInteger;->set(Ljava/lang/Integer;)V

    return-void
.end method
