.class Lcom/vk/masks/MasksStorage$2;
.super Ljava/lang/Object;
.source "MasksStorage.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/masks/MasksStorage;->dumpToDisk()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/masks/MasksStorage;

.field final synthetic val$masksToSave:Ljava/util/ArrayList;

.field final synthetic val$pathsToSave:Ljava/util/HashMap;


# direct methods
.method constructor <init>(Lcom/vk/masks/MasksStorage;Ljava/util/ArrayList;Ljava/util/HashMap;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/masks/MasksStorage;

    .prologue
    .line 196
    iput-object p1, p0, Lcom/vk/masks/MasksStorage$2;->this$0:Lcom/vk/masks/MasksStorage;

    iput-object p2, p0, Lcom/vk/masks/MasksStorage$2;->val$masksToSave:Ljava/util/ArrayList;

    iput-object p3, p0, Lcom/vk/masks/MasksStorage$2;->val$pathsToSave:Ljava/util/HashMap;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 10

    .prologue
    .line 200
    :try_start_0
    iget-object v7, p0, Lcom/vk/masks/MasksStorage$2;->this$0:Lcom/vk/masks/MasksStorage;

    invoke-static {v7}, Lcom/vk/masks/MasksStorage;->access$000(Lcom/vk/masks/MasksStorage;)Lcom/vk/attachpicker/util/Prefs;

    move-result-object v7

    invoke-virtual {v7}, Lcom/vk/attachpicker/util/Prefs;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    .line 201
    .local v2, "editor":Landroid/content/SharedPreferences$Editor;
    invoke-interface {v2}, Landroid/content/SharedPreferences$Editor;->clear()Landroid/content/SharedPreferences$Editor;

    .line 204
    new-instance v5, Lorg/json/JSONArray;

    invoke-direct {v5}, Lorg/json/JSONArray;-><init>()V

    .line 205
    .local v5, "masksJson":Lorg/json/JSONArray;
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    iget-object v7, p0, Lcom/vk/masks/MasksStorage$2;->val$masksToSave:Ljava/util/ArrayList;

    invoke-virtual {v7}, Ljava/util/ArrayList;->size()I

    move-result v7

    if-ge v3, v7, :cond_0

    .line 206
    iget-object v7, p0, Lcom/vk/masks/MasksStorage$2;->val$masksToSave:Ljava/util/ArrayList;

    invoke-virtual {v7, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/vk/masks/model/Mask;

    invoke-virtual {v7}, Lcom/vk/masks/model/Mask;->toJson()Lorg/json/JSONObject;

    move-result-object v7

    invoke-virtual {v5, v7}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 205
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 208
    :cond_0
    const-string/jumbo v7, "masks_list"

    invoke-virtual {v5}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-interface {v2, v7, v8}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 211
    new-instance v6, Lorg/json/JSONArray;

    invoke-direct {v6}, Lorg/json/JSONArray;-><init>()V

    .line 212
    .local v6, "pathsJson":Lorg/json/JSONArray;
    iget-object v7, p0, Lcom/vk/masks/MasksStorage$2;->val$pathsToSave:Ljava/util/HashMap;

    invoke-virtual {v7}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v7

    invoke-interface {v7}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :goto_1
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_1

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    .line 213
    .local v1, "e":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/Integer;>;"
    new-instance v4, Lorg/json/JSONObject;

    invoke-direct {v4}, Lorg/json/JSONObject;-><init>()V

    .line 214
    .local v4, "jo":Lorg/json/JSONObject;
    const-string/jumbo v8, "id"

    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v9

    invoke-virtual {v4, v8, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 215
    const-string/jumbo v8, "files_count"

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v9

    invoke-virtual {v4, v8, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 216
    invoke-virtual {v6, v4}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 221
    .end local v1    # "e":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Ljava/lang/Integer;>;"
    .end local v2    # "editor":Landroid/content/SharedPreferences$Editor;
    .end local v3    # "i":I
    .end local v4    # "jo":Lorg/json/JSONObject;
    .end local v5    # "masksJson":Lorg/json/JSONArray;
    .end local v6    # "pathsJson":Lorg/json/JSONArray;
    :catch_0
    move-exception v0

    .line 222
    .local v0, "e":Ljava/lang/Exception;
    invoke-static {v0}, Lcom/crashlytics/android/Crashlytics;->logException(Ljava/lang/Throwable;)V

    .line 224
    .end local v0    # "e":Ljava/lang/Exception;
    :goto_2
    return-void

    .line 218
    .restart local v2    # "editor":Landroid/content/SharedPreferences$Editor;
    .restart local v3    # "i":I
    .restart local v5    # "masksJson":Lorg/json/JSONArray;
    .restart local v6    # "pathsJson":Lorg/json/JSONArray;
    :cond_1
    :try_start_1
    const-string/jumbo v7, "files_count_list"

    invoke-virtual {v6}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-interface {v2, v7, v8}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 220
    invoke-interface {v2}, Landroid/content/SharedPreferences$Editor;->commit()Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_2
.end method
