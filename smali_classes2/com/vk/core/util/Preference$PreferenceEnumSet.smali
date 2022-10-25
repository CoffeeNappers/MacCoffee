.class public Lcom/vk/core/util/Preference$PreferenceEnumSet;
.super Lcom/vk/core/util/Preference$PreferenceValue;
.source "Preference.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/core/util/Preference;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "PreferenceEnumSet"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Enum",
        "<TT;>;>",
        "Lcom/vk/core/util/Preference$PreferenceValue",
        "<",
        "Ljava/util/EnumSet",
        "<TT;>;>;"
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
.method public constructor <init>(Landroid/content/SharedPreferences;Ljava/lang/String;Ljava/lang/Class;)V
    .locals 1
    .param p1, "preferences"    # Landroid/content/SharedPreferences;
    .param p2, "key"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/SharedPreferences;",
            "Ljava/lang/String;",
            "Ljava/lang/Class",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 183
    .local p0, "this":Lcom/vk/core/util/Preference$PreferenceEnumSet;, "Lcom/vk/core/util/Preference$PreferenceEnumSet<TT;>;"
    .local p3, "cls":Ljava/lang/Class;, "Ljava/lang/Class<TT;>;"
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/vk/core/util/Preference$PreferenceValue;-><init>(Landroid/content/SharedPreferences;Ljava/lang/String;Ljava/lang/Object;)V

    .line 185
    iput-object p3, p0, Lcom/vk/core/util/Preference$PreferenceEnumSet;->mClass:Ljava/lang/Class;

    .line 186
    return-void
.end method


# virtual methods
.method public bridge synthetic get()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 177
    .local p0, "this":Lcom/vk/core/util/Preference$PreferenceEnumSet;, "Lcom/vk/core/util/Preference$PreferenceEnumSet<TT;>;"
    invoke-virtual {p0}, Lcom/vk/core/util/Preference$PreferenceEnumSet;->get()Ljava/util/EnumSet;

    move-result-object v0

    return-object v0
.end method

.method public get()Ljava/util/EnumSet;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/EnumSet",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 190
    .local p0, "this":Lcom/vk/core/util/Preference$PreferenceEnumSet;, "Lcom/vk/core/util/Preference$PreferenceEnumSet<TT;>;"
    iget-object v3, p0, Lcom/vk/core/util/Preference$PreferenceEnumSet;->mClass:Ljava/lang/Class;

    invoke-static {v3}, Ljava/util/EnumSet;->noneOf(Ljava/lang/Class;)Ljava/util/EnumSet;

    move-result-object v0

    .line 191
    .local v0, "enumSet":Ljava/util/EnumSet;, "Ljava/util/EnumSet<TT;>;"
    iget-object v3, p0, Lcom/vk/core/util/Preference$PreferenceEnumSet;->mPreferences:Landroid/content/SharedPreferences;

    iget-object v4, p0, Lcom/vk/core/util/Preference$PreferenceEnumSet;->mKey:Ljava/lang/String;

    const/4 v5, 0x0

    invoke-interface {v3, v4, v5}, Landroid/content/SharedPreferences;->getStringSet(Ljava/lang/String;Ljava/util/Set;)Ljava/util/Set;

    move-result-object v2

    .line 192
    .local v2, "set":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    if-eqz v2, :cond_0

    .line 193
    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 194
    .local v1, "name":Ljava/lang/String;
    iget-object v4, p0, Lcom/vk/core/util/Preference$PreferenceEnumSet;->mClass:Ljava/lang/Class;

    invoke-static {v4, v1}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/util/EnumSet;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 196
    .end local v1    # "name":Ljava/lang/String;
    :cond_0
    return-object v0
.end method

.method public getCount()I
    .locals 4

    .prologue
    .line 212
    .local p0, "this":Lcom/vk/core/util/Preference$PreferenceEnumSet;, "Lcom/vk/core/util/Preference$PreferenceEnumSet<TT;>;"
    iget-object v1, p0, Lcom/vk/core/util/Preference$PreferenceEnumSet;->mPreferences:Landroid/content/SharedPreferences;

    iget-object v2, p0, Lcom/vk/core/util/Preference$PreferenceEnumSet;->mKey:Ljava/lang/String;

    const/4 v3, 0x0

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getStringSet(Ljava/lang/String;Ljava/util/Set;)Ljava/util/Set;

    move-result-object v0

    .line 214
    .local v0, "set":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    if-nez v0, :cond_0

    const/4 v1, 0x0

    :goto_0
    return v1

    :cond_0
    invoke-interface {v0}, Ljava/util/Set;->size()I

    move-result v1

    goto :goto_0
.end method

.method public isEmpty()Z
    .locals 1

    .prologue
    .line 218
    .local p0, "this":Lcom/vk/core/util/Preference$PreferenceEnumSet;, "Lcom/vk/core/util/Preference$PreferenceEnumSet<TT;>;"
    invoke-virtual {p0}, Lcom/vk/core/util/Preference$PreferenceEnumSet;->getCount()I

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public bridge synthetic set(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 177
    .local p0, "this":Lcom/vk/core/util/Preference$PreferenceEnumSet;, "Lcom/vk/core/util/Preference$PreferenceEnumSet<TT;>;"
    check-cast p1, Ljava/util/EnumSet;

    invoke-virtual {p0, p1}, Lcom/vk/core/util/Preference$PreferenceEnumSet;->set(Ljava/util/EnumSet;)V

    return-void
.end method

.method public set(Ljava/util/EnumSet;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/EnumSet",
            "<TT;>;)V"
        }
    .end annotation

    .prologue
    .line 201
    .local p0, "this":Lcom/vk/core/util/Preference$PreferenceEnumSet;, "Lcom/vk/core/util/Preference$PreferenceEnumSet<TT;>;"
    .local p1, "value":Ljava/util/EnumSet;, "Ljava/util/EnumSet<TT;>;"
    if-eqz p1, :cond_0

    invoke-virtual {p1}, Ljava/util/EnumSet;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 202
    :cond_0
    invoke-virtual {p0}, Lcom/vk/core/util/Preference$PreferenceEnumSet;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    iget-object v3, p0, Lcom/vk/core/util/Preference$PreferenceEnumSet;->mKey:Ljava/lang/String;

    invoke-interface {v2, v3}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    invoke-interface {v2}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 209
    :goto_0
    return-void

    .line 204
    :cond_1
    new-instance v0, Ljava/util/HashSet;

    invoke-virtual {p1}, Ljava/util/EnumSet;->size()I

    move-result v2

    invoke-direct {v0, v2}, Ljava/util/HashSet;-><init>(I)V

    .line 205
    .local v0, "set":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/String;>;"
    invoke-virtual {p1}, Ljava/util/EnumSet;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Enum;

    .line 206
    .local v1, "v":Ljava/lang/Enum;, "TT;"
    invoke-virtual {v1}, Ljava/lang/Enum;->name()Ljava/lang/String;

    move-result-object v3

    invoke-interface {v0, v3}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 207
    .end local v1    # "v":Ljava/lang/Enum;, "TT;"
    :cond_2
    invoke-virtual {p0}, Lcom/vk/core/util/Preference$PreferenceEnumSet;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    iget-object v3, p0, Lcom/vk/core/util/Preference$PreferenceEnumSet;->mKey:Ljava/lang/String;

    invoke-interface {v2, v3, v0}, Landroid/content/SharedPreferences$Editor;->putStringSet(Ljava/lang/String;Ljava/util/Set;)Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    invoke-interface {v2}, Landroid/content/SharedPreferences$Editor;->apply()V

    goto :goto_0
.end method
