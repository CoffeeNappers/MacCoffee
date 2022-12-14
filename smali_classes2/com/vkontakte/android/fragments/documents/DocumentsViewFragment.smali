.class public Lcom/vkontakte/android/fragments/documents/DocumentsViewFragment;
.super Lcom/vkontakte/android/fragments/VkTabbedLoaderFragment;
.source "DocumentsViewFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# static fields
.field private static final ADD_FILE_RESULT:I = 0x66

.field private static final ADD_PHOTO_RESULT:I = 0x65


# instance fields
.field private canAdd:Z

.field protected currentReq:Lcom/vkontakte/android/api/VKAPIRequest;

.field private floatingActionButton:Landroid/support/design/widget/FloatingActionButton;

.field private fragments:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/fragments/documents/DocumentsByTypeFragment;",
            ">;"
        }
    .end annotation
.end field

.field private receiver:Landroid/content/BroadcastReceiver;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 42
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/VkTabbedLoaderFragment;-><init>()V

    .line 48
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vkontakte/android/fragments/documents/DocumentsViewFragment;->canAdd:Z

    .line 49
    iput-object v1, p0, Lcom/vkontakte/android/fragments/documents/DocumentsViewFragment;->floatingActionButton:Landroid/support/design/widget/FloatingActionButton;

    .line 51
    iput-object v1, p0, Lcom/vkontakte/android/fragments/documents/DocumentsViewFragment;->fragments:Ljava/util/List;

    .line 53
    new-instance v0, Lcom/vkontakte/android/fragments/documents/DocumentsViewFragment$1;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/fragments/documents/DocumentsViewFragment$1;-><init>(Lcom/vkontakte/android/fragments/documents/DocumentsViewFragment;)V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/documents/DocumentsViewFragment;->receiver:Landroid/content/BroadcastReceiver;

    return-void
.end method

.method static synthetic access$000(Lcom/vkontakte/android/fragments/documents/DocumentsViewFragment;)Ljava/util/List;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/documents/DocumentsViewFragment;

    .prologue
    .line 42
    iget-object v0, p0, Lcom/vkontakte/android/fragments/documents/DocumentsViewFragment;->fragments:Ljava/util/List;

    return-object v0
.end method

.method static synthetic access$002(Lcom/vkontakte/android/fragments/documents/DocumentsViewFragment;Ljava/util/List;)Ljava/util/List;
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/documents/DocumentsViewFragment;
    .param p1, "x1"    # Ljava/util/List;

    .prologue
    .line 42
    iput-object p1, p0, Lcom/vkontakte/android/fragments/documents/DocumentsViewFragment;->fragments:Ljava/util/List;

    return-object p1
.end method

.method static synthetic access$100(Lcom/vkontakte/android/fragments/documents/DocumentsViewFragment;)Landroid/view/View;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/documents/DocumentsViewFragment;

    .prologue
    .line 42
    iget-object v0, p0, Lcom/vkontakte/android/fragments/documents/DocumentsViewFragment;->errorView:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$200(Lcom/vkontakte/android/fragments/documents/DocumentsViewFragment;)Landroid/view/View;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/documents/DocumentsViewFragment;

    .prologue
    .line 42
    iget-object v0, p0, Lcom/vkontakte/android/fragments/documents/DocumentsViewFragment;->progress:Landroid/view/View;

    return-object v0
.end method


# virtual methods
.method protected doLoadData()V
    .locals 3

    .prologue
    .line 129
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/documents/DocumentsViewFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v1

    const-string/jumbo v2, "owner_id"

    invoke-virtual {v1, v2}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v0

    .line 130
    .local v0, "ownerId":I
    new-instance v1, Lcom/vkontakte/android/api/docs/DocsGetTypes;

    invoke-direct {v1, v0}, Lcom/vkontakte/android/api/docs/DocsGetTypes;-><init>(I)V

    new-instance v2, Lcom/vkontakte/android/fragments/documents/DocumentsViewFragment$2;

    invoke-direct {v2, p0, v0}, Lcom/vkontakte/android/fragments/documents/DocumentsViewFragment$2;-><init>(Lcom/vkontakte/android/fragments/documents/DocumentsViewFragment;I)V

    .line 131
    invoke-virtual {v1, v2}, Lcom/vkontakte/android/api/docs/DocsGetTypes;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v1

    iget-object v2, p0, Lcom/vkontakte/android/fragments/documents/DocumentsViewFragment;->contentView:Landroid/view/ViewGroup;

    .line 156
    invoke-virtual {v1, v2}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/view/View;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v1

    iput-object v1, p0, Lcom/vkontakte/android/fragments/documents/DocumentsViewFragment;->currentReq:Lcom/vkontakte/android/api/VKAPIRequest;

    .line 157
    return-void
.end method

.method synthetic lambda$onClick$0(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 2
    .param p1, "parent"    # Landroid/widget/AdapterView;
    .param p2, "view"    # Landroid/view/View;
    .param p3, "position"    # I
    .param p4, "id"    # J

    .prologue
    .line 171
    long-to-int v0, p4

    packed-switch v0, :pswitch_data_0

    .line 179
    :goto_0
    return-void

    .line 173
    :pswitch_0
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/documents/DocumentsViewFragment;->startAddPhoto()V

    goto :goto_0

    .line 176
    :pswitch_1
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/documents/DocumentsViewFragment;->startAddFile()V

    goto :goto_0

    .line 171
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 21
    .param p1, "reqCode"    # I
    .param p2, "resCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    .line 197
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/fragments/documents/DocumentsViewFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v2

    const-string/jumbo v3, "owner_id"

    invoke-virtual {v2, v3}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v16

    .line 198
    .local v16, "ownerID":I
    const/4 v2, -0x1

    move/from16 v0, p2

    if-ne v0, v2, :cond_0

    .line 199
    new-instance v13, Ljava/util/ArrayList;

    invoke-direct {v13}, Ljava/util/ArrayList;-><init>()V

    .line 201
    .local v13, "docs":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/attachments/PendingDocumentAttachment;>;"
    const/16 v2, 0x65

    move/from16 v0, p1

    if-ne v0, v2, :cond_4

    .line 202
    const-string/jumbo v2, "result_attachments"

    move-object/from16 v0, p3

    invoke-virtual {v0, v2}, Landroid/content/Intent;->getBundleExtra(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v18

    .line 203
    .local v18, "resultBundle":Landroid/os/Bundle;
    if-eqz v18, :cond_5

    .line 204
    const-string/jumbo v2, "result_files"

    move-object/from16 v0, v18

    invoke-virtual {v0, v2}, Landroid/os/Bundle;->getParcelableArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v15

    .line 205
    .local v15, "files":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/net/Uri;>;"
    if-nez v15, :cond_1

    .line 232
    .end local v13    # "docs":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/attachments/PendingDocumentAttachment;>;"
    .end local v15    # "files":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/net/Uri;>;"
    .end local v18    # "resultBundle":Landroid/os/Bundle;
    :cond_0
    return-void

    .line 208
    .restart local v13    # "docs":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/attachments/PendingDocumentAttachment;>;"
    .restart local v15    # "files":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/net/Uri;>;"
    .restart local v18    # "resultBundle":Landroid/os/Bundle;
    :cond_1
    invoke-virtual {v15}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v10

    :cond_2
    :goto_0
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_5

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v19

    check-cast v19, Landroid/net/Uri;

    .line 209
    .local v19, "uri":Landroid/net/Uri;
    const-string/jumbo v2, "file"

    invoke-virtual/range {v19 .. v19}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_3

    const-string/jumbo v2, "content"

    invoke-virtual/range {v19 .. v19}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 212
    :cond_3
    new-instance v2, Ljava/io/File;

    invoke-virtual/range {v19 .. v19}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/io/File;->length()J

    move-result-wide v2

    long-to-int v5, v2

    .line 213
    .local v5, "size":I
    invoke-virtual/range {v19 .. v19}, Landroid/net/Uri;->getLastPathSegment()Ljava/lang/String;

    move-result-object v2

    const-string/jumbo v3, "\\."

    invoke-virtual {v2, v3}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v14

    .line 214
    .local v14, "ext":[Ljava/lang/String;
    new-instance v2, Lcom/vkontakte/android/attachments/PendingDocumentAttachment;

    invoke-virtual/range {v19 .. v19}, Landroid/net/Uri;->getLastPathSegment()Ljava/lang/String;

    move-result-object v3

    invoke-virtual/range {v19 .. v19}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual/range {v19 .. v19}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v6

    const/4 v7, 0x0

    invoke-static {}, Lcom/vkontakte/android/upload/Upload;->getNewID()I

    move-result v8

    array-length v9, v14

    add-int/lit8 v9, v9, -0x1

    aget-object v9, v14, v9

    invoke-direct/range {v2 .. v9}, Lcom/vkontakte/android/attachments/PendingDocumentAttachment;-><init>(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;IILjava/lang/String;)V

    invoke-virtual {v13, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 217
    .end local v5    # "size":I
    .end local v14    # "ext":[Ljava/lang/String;
    .end local v15    # "files":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/net/Uri;>;"
    .end local v18    # "resultBundle":Landroid/os/Bundle;
    .end local v19    # "uri":Landroid/net/Uri;
    :cond_4
    const/16 v2, 0x66

    move/from16 v0, p1

    if-ne v0, v2, :cond_5

    .line 218
    const-string/jumbo v2, "files"

    move-object/from16 v0, p3

    invoke-virtual {v0, v2}, Landroid/content/Intent;->getParcelableArrayListExtra(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_5

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v17

    check-cast v17, Landroid/os/Parcelable;

    .line 219
    .local v17, "p":Landroid/os/Parcelable;
    check-cast v17, Lcom/vkontakte/android/attachments/PendingDocumentAttachment;

    .end local v17    # "p":Landroid/os/Parcelable;
    move-object/from16 v0, v17

    invoke-virtual {v13, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 223
    :cond_5
    invoke-virtual {v13}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_0

    .line 224
    invoke-virtual {v13}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_2
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lcom/vkontakte/android/attachments/PendingDocumentAttachment;

    .line 225
    .local v12, "att":Lcom/vkontakte/android/attachments/PendingDocumentAttachment;
    new-instance v6, Lcom/vkontakte/android/upload/DocumentUploadTask;

    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/fragments/documents/DocumentsViewFragment;->getActivity()Landroid/app/Activity;

    move-result-object v7

    iget-object v8, v12, Lcom/vkontakte/android/attachments/PendingDocumentAttachment;->url:Ljava/lang/String;

    const/4 v10, 0x0

    const/4 v11, 0x1

    move/from16 v9, v16

    invoke-direct/range {v6 .. v11}, Lcom/vkontakte/android/upload/DocumentUploadTask;-><init>(Landroid/content/Context;Ljava/lang/String;IZZ)V

    .line 226
    .local v6, "task":Lcom/vkontakte/android/upload/DocumentUploadTask;
    const v3, 0x7f0801b9

    move-object/from16 v0, p0

    invoke-virtual {v0, v3}, Lcom/vkontakte/android/fragments/documents/DocumentsViewFragment;->getString(I)Ljava/lang/String;

    move-result-object v3

    const v4, 0x7f0801ba

    move-object/from16 v0, p0

    invoke-virtual {v0, v4}, Lcom/vkontakte/android/fragments/documents/DocumentsViewFragment;->getString(I)Ljava/lang/String;

    move-result-object v4

    .line 227
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/fragments/documents/DocumentsViewFragment;->getActivity()Landroid/app/Activity;

    move-result-object v7

    const/4 v8, 0x0

    new-instance v9, Landroid/content/Intent;

    const-string/jumbo v10, "android.intent.action.VIEW"

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v20, "vkontakte://vk.com/docs"

    move-object/from16 v0, v20

    invoke-virtual {v11, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    move/from16 v0, v16

    invoke-virtual {v11, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v11}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v11

    invoke-direct {v9, v10, v11}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    const/4 v10, 0x0

    invoke-static {v7, v8, v9, v10}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v7

    .line 226
    invoke-virtual {v6, v3, v4, v7}, Lcom/vkontakte/android/upload/DocumentUploadTask;->setDoneNotification(Ljava/lang/String;Ljava/lang/String;Landroid/app/PendingIntent;)V

    .line 228
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/fragments/documents/DocumentsViewFragment;->getActivity()Landroid/app/Activity;

    move-result-object v3

    invoke-static {v3, v6}, Lcom/vkontakte/android/upload/Upload;->start(Landroid/content/Context;Lcom/vkontakte/android/upload/UploadTask;)V

    goto :goto_2
.end method

.method public onAttach(Landroid/app/Activity;)V
    .locals 3
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 90
    invoke-super {p0, p1}, Lcom/vkontakte/android/fragments/VkTabbedLoaderFragment;->onAttach(Landroid/app/Activity;)V

    .line 91
    const v1, 0x7f0801bd

    invoke-virtual {p0, v1}, Lcom/vkontakte/android/fragments/documents/DocumentsViewFragment;->setTitle(I)V

    .line 92
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/documents/DocumentsViewFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v1

    const-string/jumbo v2, "owner_id"

    invoke-virtual {v1, v2}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v0

    .line 93
    .local v0, "ownerID":I
    if-eqz v0, :cond_0

    invoke-static {v0}, Lcom/vkontakte/android/auth/VKAccountManager;->isCurrentUser(I)Z

    move-result v1

    if-eqz v1, :cond_1

    :cond_0
    const/4 v1, 0x1

    :goto_0
    invoke-virtual {p0, v1}, Lcom/vkontakte/android/fragments/documents/DocumentsViewFragment;->setCanAdd(Z)V

    .line 94
    return-void

    .line 93
    :cond_1
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public onClick(Landroid/view/View;)V
    .locals 5
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 165
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v1

    packed-switch v1, :pswitch_data_0

    .line 182
    :goto_0
    return-void

    .line 167
    :pswitch_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 168
    .local v0, "items":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/ui/ListDialog$ListDialogItem;>;"
    new-instance v1, Lcom/vkontakte/android/ui/ListDialog$ListDialogItem;

    const/4 v2, 0x0

    const v3, 0x7f0800a7

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const v4, 0x7f02019d

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-direct {v1, v2, v3, v4}, Lcom/vkontakte/android/ui/ListDialog$ListDialogItem;-><init>(ILjava/lang/Object;Ljava/lang/Object;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 169
    new-instance v1, Lcom/vkontakte/android/ui/ListDialog$ListDialogItem;

    const/4 v2, 0x1

    const v3, 0x7f0800a5

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const v4, 0x7f02019e

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-direct {v1, v2, v3, v4}, Lcom/vkontakte/android/ui/ListDialog$ListDialogItem;-><init>(ILjava/lang/Object;Ljava/lang/Object;)V

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 170
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {p0}, Lcom/vkontakte/android/fragments/documents/DocumentsViewFragment$$Lambda$1;->lambdaFactory$(Lcom/vkontakte/android/fragments/documents/DocumentsViewFragment;)Landroid/widget/AdapterView$OnItemClickListener;

    move-result-object v2

    invoke-static {v1, v0, p1, v2}, Lcom/vkontakte/android/ui/ListDialog;->show(Landroid/content/Context;Ljava/util/List;Landroid/view/View;Landroid/widget/AdapterView$OnItemClickListener;)V

    goto :goto_0

    .line 165
    nop

    :pswitch_data_0
    .packed-switch 0x7f100297
        :pswitch_0
    .end packed-switch
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 5
    .param p1, "b"    # Landroid/os/Bundle;

    .prologue
    .line 72
    invoke-super {p0, p1}, Lcom/vkontakte/android/fragments/VkTabbedLoaderFragment;->onCreate(Landroid/os/Bundle;)V

    .line 73
    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    .line 74
    .local v0, "filter":Landroid/content/IntentFilter;
    const-string/jumbo v1, "com.vkontakte.android.UPLOAD_DONE"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 75
    const-string/jumbo v1, "com.vkontakte.android.UPLOAD_FAILED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 76
    sget-object v1, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    iget-object v2, p0, Lcom/vkontakte/android/fragments/documents/DocumentsViewFragment;->receiver:Landroid/content/BroadcastReceiver;

    const-string/jumbo v3, "com.vkontakte.android.permission.ACCESS_DATA"

    const/4 v4, 0x0

    invoke-virtual {v1, v2, v0, v3, v4}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;Ljava/lang/String;Landroid/os/Handler;)Landroid/content/Intent;

    .line 77
    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 5
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/4 v3, 0x0

    .line 104
    invoke-super {p0, p1, p2, p3}, Lcom/vkontakte/android/fragments/VkTabbedLoaderFragment;->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;

    move-result-object v1

    .line 105
    .local v1, "view":Landroid/view/View;
    new-instance v0, Landroid/widget/FrameLayout;

    invoke-virtual {p1}, Landroid/view/LayoutInflater;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v0, v2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 106
    .local v0, "relativeLayout":Landroid/widget/FrameLayout;
    const v2, 0x7f03009e

    invoke-virtual {p1, v2, v0, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/support/design/widget/FloatingActionButton;

    iput-object v2, p0, Lcom/vkontakte/android/fragments/documents/DocumentsViewFragment;->floatingActionButton:Landroid/support/design/widget/FloatingActionButton;

    .line 107
    iget-object v2, p0, Lcom/vkontakte/android/fragments/documents/DocumentsViewFragment;->floatingActionButton:Landroid/support/design/widget/FloatingActionButton;

    invoke-virtual {v2, p0}, Landroid/support/design/widget/FloatingActionButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 108
    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    .line 109
    iget-object v2, p0, Lcom/vkontakte/android/fragments/documents/DocumentsViewFragment;->floatingActionButton:Landroid/support/design/widget/FloatingActionButton;

    iget-object v4, p0, Lcom/vkontakte/android/fragments/documents/DocumentsViewFragment;->floatingActionButton:Landroid/support/design/widget/FloatingActionButton;

    invoke-virtual {v4}, Landroid/support/design/widget/FloatingActionButton;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v4

    invoke-virtual {v0, v2, v4}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 110
    iget-object v4, p0, Lcom/vkontakte/android/fragments/documents/DocumentsViewFragment;->floatingActionButton:Landroid/support/design/widget/FloatingActionButton;

    iget-boolean v2, p0, Lcom/vkontakte/android/fragments/documents/DocumentsViewFragment;->canAdd:Z

    if-eqz v2, :cond_0

    move v2, v3

    :goto_0
    invoke-static {v4, v2}, Lcom/vkontakte/android/ViewUtils;->setVisibility(Landroid/view/View;I)V

    .line 111
    return-object v0

    .line 110
    :cond_0
    const/16 v2, 0x8

    goto :goto_0
.end method

.method public onDestroy()V
    .locals 2

    .prologue
    .line 80
    invoke-super {p0}, Lcom/vkontakte/android/fragments/VkTabbedLoaderFragment;->onDestroy()V

    .line 82
    :try_start_0
    sget-object v0, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/documents/DocumentsViewFragment;->receiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v0, v1}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 86
    :goto_0
    return-void

    .line 83
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public onDestroyView()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 116
    invoke-super {p0}, Lcom/vkontakte/android/fragments/VkTabbedLoaderFragment;->onDestroyView()V

    .line 117
    iput-object v0, p0, Lcom/vkontakte/android/fragments/documents/DocumentsViewFragment;->floatingActionButton:Landroid/support/design/widget/FloatingActionButton;

    .line 118
    iput-object v0, p0, Lcom/vkontakte/android/fragments/documents/DocumentsViewFragment;->fragments:Ljava/util/List;

    .line 119
    return-void
.end method

.method public onRefresh()V
    .locals 0

    .prologue
    .line 161
    return-void
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 0
    .param p1, "view"    # Landroid/view/View;
    .param p2, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 123
    invoke-super {p0, p1, p2}, Lcom/vkontakte/android/fragments/VkTabbedLoaderFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    .line 124
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/documents/DocumentsViewFragment;->loadData()V

    .line 125
    return-void
.end method

.method setCanAdd(Z)V
    .locals 2
    .param p1, "canAdd"    # Z

    .prologue
    .line 97
    iput-boolean p1, p0, Lcom/vkontakte/android/fragments/documents/DocumentsViewFragment;->canAdd:Z

    .line 98
    iget-object v1, p0, Lcom/vkontakte/android/fragments/documents/DocumentsViewFragment;->floatingActionButton:Landroid/support/design/widget/FloatingActionButton;

    if-eqz p1, :cond_0

    const/4 v0, 0x0

    :goto_0
    invoke-static {v1, v0}, Lcom/vkontakte/android/ViewUtils;->setVisibility(Landroid/view/View;I)V

    .line 100
    return-void

    .line 98
    :cond_0
    const/16 v0, 0x8

    goto :goto_0
.end method

.method startAddFile()V
    .locals 4

    .prologue
    .line 193
    new-instance v0, Lcom/vkontakte/android/fragments/utils/FilePickerFragment$Builder;

    invoke-direct {v0}, Lcom/vkontakte/android/fragments/utils/FilePickerFragment$Builder;-><init>()V

    const-wide/32 v2, 0xc800000

    invoke-virtual {v0, v2, v3}, Lcom/vkontakte/android/fragments/utils/FilePickerFragment$Builder;->setSizeLimit(J)Lcom/vkontakte/android/fragments/utils/FilePickerFragment$Builder;

    move-result-object v0

    const/16 v1, 0x66

    invoke-virtual {v0, p0, v1}, Lcom/vkontakte/android/fragments/utils/FilePickerFragment$Builder;->forResult(Landroid/app/Fragment;I)Z

    .line 194
    return-void
.end method

.method startAddPhoto()V
    .locals 3

    .prologue
    .line 185
    new-instance v0, Landroid/content/Intent;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/documents/DocumentsViewFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    const-class v2, Lcom/vk/attachpicker/PhotoVideoAttachActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 186
    .local v0, "intent":Landroid/content/Intent;
    const-string/jumbo v1, "selection_limit"

    const/16 v2, 0x64

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 187
    const-string/jumbo v1, "prevent_styling"

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 188
    const-string/jumbo v1, "media_type"

    const/16 v2, 0x6f

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 189
    const/16 v1, 0x65

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/fragments/documents/DocumentsViewFragment;->startActivityForResult(Landroid/content/Intent;I)V

    .line 190
    return-void
.end method
