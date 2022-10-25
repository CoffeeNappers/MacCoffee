.class public Lcom/vk/masks/MasksPrefs;
.super Lcom/vk/attachpicker/util/Prefs;
.source "MasksPrefs.java"


# static fields
.field private static final KEY_MASK_SECTIONS:Ljava/lang/String; = "mask_sections"

.field private static final KEY_MODEL_FILES_COUNT:Ljava/lang/String; = "engine_model_files_count"

.field private static final KEY_MODEL_VERSION:Ljava/lang/String; = "engine_model_version"

.field private static volatile globalInstance:Lcom/vk/masks/MasksPrefs;


# direct methods
.method private constructor <init>()V
    .locals 1

    .prologue
    .line 32
    const-string/jumbo v0, "masks"

    invoke-direct {p0, v0}, Lcom/vk/attachpicker/util/Prefs;-><init>(Ljava/lang/String;)V

    .line 33
    return-void
.end method

.method public static instance()Lcom/vk/masks/MasksPrefs;
    .locals 2

    .prologue
    .line 17
    sget-object v0, Lcom/vk/masks/MasksPrefs;->globalInstance:Lcom/vk/masks/MasksPrefs;

    if-nez v0, :cond_1

    .line 18
    const-class v1, Lcom/vk/attachpicker/util/Prefs;

    monitor-enter v1

    .line 19
    :try_start_0
    sget-object v0, Lcom/vk/masks/MasksPrefs;->globalInstance:Lcom/vk/masks/MasksPrefs;

    if-nez v0, :cond_0

    .line 20
    new-instance v0, Lcom/vk/masks/MasksPrefs;

    invoke-direct {v0}, Lcom/vk/masks/MasksPrefs;-><init>()V

    sput-object v0, Lcom/vk/masks/MasksPrefs;->globalInstance:Lcom/vk/masks/MasksPrefs;

    .line 22
    :cond_0
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 24
    :cond_1
    sget-object v0, Lcom/vk/masks/MasksPrefs;->globalInstance:Lcom/vk/masks/MasksPrefs;

    return-object v0

    .line 22
    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method


# virtual methods
.method public getEngineModelFilesCount()I
    .locals 1

    .prologue
    .line 74
    const-string/jumbo v0, "engine_model_files_count"

    invoke-virtual {p0, v0}, Lcom/vk/masks/MasksPrefs;->getInt(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public getEngineModelVersion()I
    .locals 1

    .prologue
    .line 66
    const-string/jumbo v0, "engine_model_version"

    invoke-virtual {p0, v0}, Lcom/vk/masks/MasksPrefs;->getInt(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public getSections()Ljava/util/ArrayList;
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vk/masks/model/MaskSection;",
            ">;"
        }
    .end annotation

    .prologue
    .line 36
    const-string/jumbo v5, "mask_sections"

    invoke-virtual {p0, v5}, Lcom/vk/masks/MasksPrefs;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 37
    .local v3, "jsonString":Ljava/lang/String;
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v5

    if-eqz v5, :cond_1

    .line 38
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 48
    :cond_0
    :goto_0
    return-object v4

    .line 41
    :cond_1
    :try_start_0
    new-instance v2, Lorg/json/JSONArray;

    invoke-direct {v2, v3}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    .line 42
    .local v2, "items":Lorg/json/JSONArray;
    new-instance v4, Ljava/util/ArrayList;

    invoke-virtual {v2}, Lorg/json/JSONArray;->length()I

    move-result v5

    invoke-direct {v4, v5}, Ljava/util/ArrayList;-><init>(I)V

    .line 43
    .local v4, "sections":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vk/masks/model/MaskSection;>;"
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_1
    invoke-virtual {v2}, Lorg/json/JSONArray;->length()I

    move-result v5

    if-ge v1, v5, :cond_0

    .line 44
    new-instance v5, Lcom/vk/masks/model/MaskSection;

    invoke-virtual {v2, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v6

    invoke-direct {v5, v6}, Lcom/vk/masks/model/MaskSection;-><init>(Lorg/json/JSONObject;)V

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 43
    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    .line 47
    .end local v1    # "i":I
    .end local v2    # "items":Lorg/json/JSONArray;
    .end local v4    # "sections":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vk/masks/model/MaskSection;>;"
    :catch_0
    move-exception v0

    .line 48
    .local v0, "e":Ljava/lang/Exception;
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    goto :goto_0
.end method

.method public setEngineModelFileCount(I)V
    .locals 2
    .param p1, "count"    # I

    .prologue
    .line 78
    invoke-virtual {p0}, Lcom/vk/masks/MasksPrefs;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string/jumbo v1, "engine_model_files_count"

    invoke-interface {v0, v1, p1}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 79
    return-void
.end method

.method public setEngineModelVersion(I)V
    .locals 2
    .param p1, "v"    # I

    .prologue
    .line 70
    invoke-virtual {p0}, Lcom/vk/masks/MasksPrefs;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string/jumbo v1, "engine_model_version"

    invoke-interface {v0, v1, p1}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 71
    return-void
.end method

.method public setSections(Ljava/util/ArrayList;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vk/masks/model/MaskSection;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 54
    .local p1, "sections":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vk/masks/model/MaskSection;>;"
    if-nez p1, :cond_0

    .line 55
    invoke-virtual {p0}, Lcom/vk/masks/MasksPrefs;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    const-string/jumbo v3, "mask_sections"

    invoke-interface {v2, v3}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 63
    :goto_0
    return-void

    .line 57
    :cond_0
    new-instance v1, Lorg/json/JSONArray;

    invoke-direct {v1}, Lorg/json/JSONArray;-><init>()V

    .line 58
    .local v1, "items":Lorg/json/JSONArray;
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v0, v2, :cond_1

    .line 59
    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vk/masks/model/MaskSection;

    invoke-virtual {v2}, Lcom/vk/masks/model/MaskSection;->toJson()Lorg/json/JSONObject;

    move-result-object v2

    invoke-virtual {v1, v2}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 58
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 61
    :cond_1
    invoke-virtual {p0}, Lcom/vk/masks/MasksPrefs;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    const-string/jumbo v3, "mask_sections"

    invoke-virtual {v1}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v2, v3, v4}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    invoke-interface {v2}, Landroid/content/SharedPreferences$Editor;->commit()Z

    goto :goto_0
.end method
