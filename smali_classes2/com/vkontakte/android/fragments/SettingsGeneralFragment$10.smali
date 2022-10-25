.class final Lcom/vkontakte/android/fragments/SettingsGeneralFragment$10;
.super Lcom/vkontakte/android/api/SimpleCallback;
.source "SettingsGeneralFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/SettingsGeneralFragment;->downloadAudio(Landroid/content/Context;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/api/SimpleCallback",
        "<",
        "Lcom/vkontakte/android/data/VKList",
        "<",
        "Lcom/vkontakte/android/audio/MusicTrack;",
        ">;>;"
    }
.end annotation


# instance fields
.field final synthetic val$ctx:Landroid/content/Context;


# direct methods
.method constructor <init>(Landroid/content/Context;Landroid/content/Context;)V
    .locals 0
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 325
    iput-object p2, p0, Lcom/vkontakte/android/fragments/SettingsGeneralFragment$10;->val$ctx:Landroid/content/Context;

    invoke-direct {p0, p1}, Lcom/vkontakte/android/api/SimpleCallback;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public success(Lcom/vkontakte/android/data/VKList;)V
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/vkontakte/android/data/VKList",
            "<",
            "Lcom/vkontakte/android/audio/MusicTrack;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p1, "audios":Lcom/vkontakte/android/data/VKList;, "Lcom/vkontakte/android/data/VKList<Lcom/vkontakte/android/audio/MusicTrack;>;"
    const/4 v6, 0x1

    const/4 v8, 0x0

    .line 328
    new-instance v3, Landroid/util/SparseArray;

    invoke-direct {v3}, Landroid/util/SparseArray;-><init>()V

    .line 329
    .local v3, "lists":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Ljava/util/ArrayList<Lcom/vkontakte/android/audio/MusicTrack;>;>;"
    invoke-virtual {p1}, Lcom/vkontakte/android/data/VKList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_0
    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_2

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/audio/MusicTrack;

    .line 330
    .local v0, "f":Lcom/vkontakte/android/audio/MusicTrack;
    invoke-virtual {v0}, Lcom/vkontakte/android/audio/MusicTrack;->getAlbumId()I

    move-result v5

    if-eqz v5, :cond_0

    .line 331
    invoke-virtual {v0}, Lcom/vkontakte/android/audio/MusicTrack;->getAlbumId()I

    move-result v5

    invoke-virtual {v3, v5}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/ArrayList;

    .line 332
    .local v2, "l":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/audio/MusicTrack;>;"
    if-nez v2, :cond_1

    .line 333
    invoke-virtual {v0}, Lcom/vkontakte/android/audio/MusicTrack;->getAlbumId()I

    move-result v5

    new-instance v2, Ljava/util/ArrayList;

    .end local v2    # "l":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/audio/MusicTrack;>;"
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .restart local v2    # "l":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/audio/MusicTrack;>;"
    invoke-virtual {v3, v5, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 335
    :cond_1
    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 339
    .end local v0    # "f":Lcom/vkontakte/android/audio/MusicTrack;
    .end local v2    # "l":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/audio/MusicTrack;>;"
    :cond_2
    new-array v1, v6, [Ljava/lang/String;

    .line 340
    .local v1, "items":[Ljava/lang/String;
    iget-object v4, p0, Lcom/vkontakte/android/fragments/SettingsGeneralFragment$10;->val$ctx:Landroid/content/Context;

    const v5, 0x7f0800c9

    new-array v6, v6, [Ljava/lang/Object;

    invoke-virtual {p1}, Lcom/vkontakte/android/data/VKList;->size()I

    move-result v7

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v6, v8

    invoke-virtual {v4, v5, v6}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    aput-object v4, v1, v8

    .line 341
    new-instance v4, Lcom/vkontakte/android/VKAlertDialog$Builder;

    iget-object v5, p0, Lcom/vkontakte/android/fragments/SettingsGeneralFragment$10;->val$ctx:Landroid/content/Context;

    invoke-direct {v4, v5}, Lcom/vkontakte/android/VKAlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v5, 0x7f0805f1

    .line 342
    invoke-virtual {v4, v5}, Lcom/vkontakte/android/VKAlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v4

    new-instance v5, Lcom/vkontakte/android/fragments/SettingsGeneralFragment$10$1;

    invoke-direct {v5, p0, p1}, Lcom/vkontakte/android/fragments/SettingsGeneralFragment$10$1;-><init>(Lcom/vkontakte/android/fragments/SettingsGeneralFragment$10;Lcom/vkontakte/android/data/VKList;)V

    .line 343
    invoke-virtual {v4, v1, v5}, Landroid/app/AlertDialog$Builder;->setItems([Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v4

    .line 350
    invoke-virtual {v4}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 351
    return-void
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 325
    check-cast p1, Lcom/vkontakte/android/data/VKList;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/SettingsGeneralFragment$10;->success(Lcom/vkontakte/android/data/VKList;)V

    return-void
.end method
