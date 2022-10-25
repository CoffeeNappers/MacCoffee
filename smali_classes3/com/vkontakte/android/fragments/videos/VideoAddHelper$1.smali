.class Lcom/vkontakte/android/fragments/videos/VideoAddHelper$1;
.super Lcom/vkontakte/android/api/SimpleCallback;
.source "VideoAddHelper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/videos/VideoAddHelper;->showAlbumsDialog(ILcom/vkontakte/android/api/VideoFile;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/api/SimpleCallback",
        "<",
        "Lcom/vkontakte/android/api/video/VideoGetAlbumsByVideo$Result;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/videos/VideoAddHelper;

.field final synthetic val$targetID:I

.field final synthetic val$video:Lcom/vkontakte/android/api/VideoFile;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/videos/VideoAddHelper;Landroid/content/Context;Lcom/vkontakte/android/api/VideoFile;I)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/videos/VideoAddHelper;
    .param p2, "context"    # Landroid/content/Context;

    .prologue
    .line 43
    iput-object p1, p0, Lcom/vkontakte/android/fragments/videos/VideoAddHelper$1;->this$0:Lcom/vkontakte/android/fragments/videos/VideoAddHelper;

    iput-object p3, p0, Lcom/vkontakte/android/fragments/videos/VideoAddHelper$1;->val$video:Lcom/vkontakte/android/api/VideoFile;

    iput p4, p0, Lcom/vkontakte/android/fragments/videos/VideoAddHelper$1;->val$targetID:I

    invoke-direct {p0, p2}, Lcom/vkontakte/android/api/SimpleCallback;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public success(Lcom/vkontakte/android/api/video/VideoGetAlbumsByVideo$Result;)V
    .locals 13
    .param p1, "result"    # Lcom/vkontakte/android/api/video/VideoGetAlbumsByVideo$Result;

    .prologue
    const/4 v12, 0x0

    .line 46
    new-instance v10, Ljava/util/ArrayList;

    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    .line 47
    .local v10, "items":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 48
    .local v6, "_states":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Boolean;>;"
    iget-object v0, p0, Lcom/vkontakte/android/fragments/videos/VideoAddHelper$1;->val$video:Lcom/vkontakte/android/api/VideoFile;

    iget v0, v0, Lcom/vkontakte/android/api/VideoFile;->oid:I

    iget v1, p0, Lcom/vkontakte/android/fragments/videos/VideoAddHelper$1;->val$targetID:I

    if-ne v0, v1, :cond_0

    .line 49
    iget-object v0, p0, Lcom/vkontakte/android/fragments/videos/VideoAddHelper$1;->this$0:Lcom/vkontakte/android/fragments/videos/VideoAddHelper;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/videos/VideoAddHelper;->access$000(Lcom/vkontakte/android/fragments/videos/VideoAddHelper;)Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f080752

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v10, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 50
    const/4 v0, 0x1

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v6, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 52
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/fragments/videos/VideoAddHelper$1;->this$0:Lcom/vkontakte/android/fragments/videos/VideoAddHelper;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/videos/VideoAddHelper;->access$000(Lcom/vkontakte/android/fragments/videos/VideoAddHelper;)Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f080750

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v10, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 53
    iget-object v0, p1, Lcom/vkontakte/android/api/video/VideoGetAlbumsByVideo$Result;->addedAlbums:Ljava/util/List;

    const/4 v1, -0x2

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    invoke-virtual {v6, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 54
    iget-object v0, p1, Lcom/vkontakte/android/api/video/VideoGetAlbumsByVideo$Result;->userAlbums:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lcom/vkontakte/android/api/VideoAlbum;

    .line 55
    .local v11, "va":Lcom/vkontakte/android/api/VideoAlbum;
    iget-object v1, v11, Lcom/vkontakte/android/api/VideoAlbum;->title:Ljava/lang/String;

    invoke-virtual {v10, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 56
    iget-object v1, p1, Lcom/vkontakte/android/api/video/VideoGetAlbumsByVideo$Result;->addedAlbums:Ljava/util/List;

    iget v4, v11, Lcom/vkontakte/android/api/VideoAlbum;->id:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {v1, v4}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v1

    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v6, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 59
    .end local v11    # "va":Lcom/vkontakte/android/api/VideoAlbum;
    :cond_1
    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v0

    new-array v2, v0, [Z

    .line 60
    .local v2, "states":[Z
    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v0

    new-array v3, v0, [Z

    .line 61
    .local v3, "oldStates":[Z
    const/4 v9, 0x0

    .local v9, "i":I
    :goto_1
    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-ge v9, v0, :cond_2

    .line 62
    invoke-virtual {v6, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    aput-boolean v0, v2, v9

    .line 63
    invoke-virtual {v6, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    aput-boolean v0, v3, v9

    .line 61
    add-int/lit8 v9, v9, 0x1

    goto :goto_1

    .line 66
    :cond_2
    new-instance v0, Lcom/vkontakte/android/VKAlertDialog$Builder;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/videos/VideoAddHelper$1;->this$0:Lcom/vkontakte/android/fragments/videos/VideoAddHelper;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/videos/VideoAddHelper;->access$000(Lcom/vkontakte/android/fragments/videos/VideoAddHelper;)Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/vkontakte/android/VKAlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v1, 0x7f08074e

    .line 67
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/VKAlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 68
    invoke-virtual {v10}, Ljava/util/ArrayList;->size()I

    move-result v0

    new-array v0, v0, [Ljava/lang/String;

    invoke-virtual {v10, v0}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Ljava/lang/CharSequence;

    new-instance v4, Lcom/vkontakte/android/fragments/videos/VideoAddHelper$1$1;

    invoke-direct {v4, p0}, Lcom/vkontakte/android/fragments/videos/VideoAddHelper$1$1;-><init>(Lcom/vkontakte/android/fragments/videos/VideoAddHelper$1;)V

    invoke-virtual {v1, v0, v2, v4}, Landroid/app/AlertDialog$Builder;->setMultiChoiceItems([Ljava/lang/CharSequence;[ZLandroid/content/DialogInterface$OnMultiChoiceClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f080479

    .line 74
    invoke-virtual {v0, v1, v12}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f08011f

    .line 75
    invoke-virtual {v0, v1, v12}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 76
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    move-result-object v5

    .line 77
    .local v5, "dlg":Landroid/app/AlertDialog;
    const/4 v0, -0x1

    invoke-virtual {v5, v0}, Landroid/app/AlertDialog;->getButton(I)Landroid/widget/Button;

    move-result-object v12

    new-instance v0, Lcom/vkontakte/android/fragments/videos/VideoAddHelper$1$2;

    move-object v1, p0

    move-object v4, p1

    invoke-direct/range {v0 .. v5}, Lcom/vkontakte/android/fragments/videos/VideoAddHelper$1$2;-><init>(Lcom/vkontakte/android/fragments/videos/VideoAddHelper$1;[Z[ZLcom/vkontakte/android/api/video/VideoGetAlbumsByVideo$Result;Landroid/app/AlertDialog;)V

    invoke-virtual {v12, v0}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 112
    invoke-virtual {v5}, Landroid/app/AlertDialog;->getListView()Landroid/widget/ListView;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/ListView;->getAdapter()Landroid/widget/ListAdapter;

    move-result-object v7

    .line 113
    .local v7, "adapter":Landroid/widget/ListAdapter;
    new-instance v8, Lcom/vkontakte/android/fragments/videos/VideoAddHelper$1$3;

    invoke-direct {v8, p0, v7}, Lcom/vkontakte/android/fragments/videos/VideoAddHelper$1$3;-><init>(Lcom/vkontakte/android/fragments/videos/VideoAddHelper$1;Landroid/widget/ListAdapter;)V

    .line 150
    .local v8, "disableableAdapter":Landroid/widget/BaseAdapter;
    invoke-virtual {v5}, Landroid/app/AlertDialog;->getListView()Landroid/widget/ListView;

    move-result-object v0

    invoke-virtual {v0, v8}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 151
    return-void
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 43
    check-cast p1, Lcom/vkontakte/android/api/video/VideoGetAlbumsByVideo$Result;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/videos/VideoAddHelper$1;->success(Lcom/vkontakte/android/api/video/VideoGetAlbumsByVideo$Result;)V

    return-void
.end method
