.class public Lcom/vkontakte/android/fragments/documents/DocumentsByTypeFragment;
.super Lcom/vkontakte/android/fragments/VKRecyclerFragment;
.source "DocumentsByTypeFragment.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/fragments/documents/DocumentsByTypeFragment$DocsAdapter;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/fragments/VKRecyclerFragment",
        "<",
        "Lcom/vkontakte/android/api/Document;",
        ">;"
    }
.end annotation


# static fields
.field private static final PRELOADED_DOCS:Ljava/lang/String; = "preloaded_docs"


# instance fields
.field private docsAdapter:Lcom/vkontakte/android/fragments/documents/DocumentsByTypeFragment$DocsAdapter;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 58
    const/16 v0, 0x32

    invoke-direct {p0, v0}, Lcom/vkontakte/android/fragments/VKRecyclerFragment;-><init>(I)V

    .line 55
    new-instance v0, Lcom/vkontakte/android/fragments/documents/DocumentsByTypeFragment$DocsAdapter;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/fragments/documents/DocumentsByTypeFragment$DocsAdapter;-><init>(Lcom/vkontakte/android/fragments/documents/DocumentsByTypeFragment;)V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/documents/DocumentsByTypeFragment;->docsAdapter:Lcom/vkontakte/android/fragments/documents/DocumentsByTypeFragment$DocsAdapter;

    .line 59
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/documents/DocumentsByTypeFragment;->setRefreshEnabled(Z)V

    .line 60
    return-void
.end method

.method static synthetic access$000(Lcom/vkontakte/android/fragments/documents/DocumentsByTypeFragment;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/documents/DocumentsByTypeFragment;

    .prologue
    .line 41
    iget-object v0, p0, Lcom/vkontakte/android/fragments/documents/DocumentsByTypeFragment;->data:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$100(Lcom/vkontakte/android/fragments/documents/DocumentsByTypeFragment;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/documents/DocumentsByTypeFragment;

    .prologue
    .line 41
    iget-object v0, p0, Lcom/vkontakte/android/fragments/documents/DocumentsByTypeFragment;->data:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$200(Lcom/vkontakte/android/fragments/documents/DocumentsByTypeFragment;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/documents/DocumentsByTypeFragment;

    .prologue
    .line 41
    iget-object v0, p0, Lcom/vkontakte/android/fragments/documents/DocumentsByTypeFragment;->data:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$300(Lcom/vkontakte/android/fragments/documents/DocumentsByTypeFragment;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/documents/DocumentsByTypeFragment;

    .prologue
    .line 41
    iget-object v0, p0, Lcom/vkontakte/android/fragments/documents/DocumentsByTypeFragment;->data:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$400(Lcom/vkontakte/android/fragments/documents/DocumentsByTypeFragment;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/documents/DocumentsByTypeFragment;

    .prologue
    .line 41
    iget-object v0, p0, Lcom/vkontakte/android/fragments/documents/DocumentsByTypeFragment;->data:Ljava/util/ArrayList;

    return-object v0
.end method

.method private confirmAndDelete(Lcom/vkontakte/android/api/Document;)V
    .locals 3
    .param p1, "doc"    # Lcom/vkontakte/android/api/Document;

    .prologue
    .line 143
    new-instance v0, Lcom/vkontakte/android/VKAlertDialog$Builder;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/documents/DocumentsByTypeFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/vkontakte/android/VKAlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v1, 0x7f080176

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/VKAlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f0801bf

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f080798

    invoke-static {p0, p1}, Lcom/vkontakte/android/fragments/documents/DocumentsByTypeFragment$$Lambda$2;->lambdaFactory$(Lcom/vkontakte/android/fragments/documents/DocumentsByTypeFragment;Lcom/vkontakte/android/api/Document;)Landroid/content/DialogInterface$OnClickListener;

    move-result-object v2

    .line 144
    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f080433

    const/4 v2, 0x0

    .line 146
    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 147
    return-void
.end method

.method public static create(IILcom/vkontakte/android/data/VKList;)Lcom/vkontakte/android/fragments/documents/DocumentsByTypeFragment;
    .locals 3
    .param p0, "ownerId"    # I
    .param p1, "typeId"    # I
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II",
            "Lcom/vkontakte/android/data/VKList",
            "<",
            "Lcom/vkontakte/android/api/Document;",
            ">;)",
            "Lcom/vkontakte/android/fragments/documents/DocumentsByTypeFragment;"
        }
    .end annotation

    .prologue
    .line 46
    .local p2, "documents":Lcom/vkontakte/android/data/VKList;, "Lcom/vkontakte/android/data/VKList<Lcom/vkontakte/android/api/Document;>;"
    new-instance v1, Lcom/vkontakte/android/fragments/documents/DocumentsByTypeFragment;

    invoke-direct {v1}, Lcom/vkontakte/android/fragments/documents/DocumentsByTypeFragment;-><init>()V

    .line 47
    .local v1, "fragment":Lcom/vkontakte/android/fragments/documents/DocumentsByTypeFragment;
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 48
    .local v0, "bundle":Landroid/os/Bundle;
    const-string/jumbo v2, "owner_id"

    invoke-virtual {v0, v2, p0}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 49
    const-string/jumbo v2, "type_id"

    invoke-virtual {v0, v2, p1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 50
    const-string/jumbo v2, "preloaded_docs"

    invoke-virtual {v0, v2, p2}, Landroid/os/Bundle;->putParcelableArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 51
    invoke-virtual {v1, v0}, Lcom/vkontakte/android/fragments/documents/DocumentsByTypeFragment;->setArguments(Landroid/os/Bundle;)V

    .line 52
    return-object v1
.end method

.method private doDelete(Lcom/vkontakte/android/api/Document;)V
    .locals 3
    .param p1, "doc"    # Lcom/vkontakte/android/api/Document;

    .prologue
    .line 150
    new-instance v0, Lcom/vkontakte/android/api/docs/DocsDelete;

    iget v1, p1, Lcom/vkontakte/android/api/Document;->oid:I

    iget v2, p1, Lcom/vkontakte/android/api/Document;->did:I

    invoke-direct {v0, v1, v2}, Lcom/vkontakte/android/api/docs/DocsDelete;-><init>(II)V

    new-instance v1, Lcom/vkontakte/android/fragments/documents/DocumentsByTypeFragment$2;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/documents/DocumentsByTypeFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-direct {v1, p0, v2, p1}, Lcom/vkontakte/android/fragments/documents/DocumentsByTypeFragment$2;-><init>(Lcom/vkontakte/android/fragments/documents/DocumentsByTypeFragment;Landroid/content/Context;Lcom/vkontakte/android/api/Document;)V

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/docs/DocsDelete;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 157
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/documents/DocumentsByTypeFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->wrapProgress(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/documents/DocumentsByTypeFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 158
    return-void
.end method


# virtual methods
.method protected doLoadData(II)V
    .locals 4
    .param p1, "offset"    # I
    .param p2, "count"    # I

    .prologue
    .line 77
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/documents/DocumentsByTypeFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 78
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/documents/DocumentsByTypeFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v2

    const-string/jumbo v3, "owner_id"

    invoke-virtual {v2, v3}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v0

    .line 79
    .local v0, "ownerID":I
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/documents/DocumentsByTypeFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v2

    const-string/jumbo v3, "type_id"

    invoke-virtual {v2, v3}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v1

    .line 80
    .local v1, "typeID":I
    new-instance v2, Lcom/vkontakte/android/api/docs/DocsGet;

    invoke-direct {v2, v0, p1, p2, v1}, Lcom/vkontakte/android/api/docs/DocsGet;-><init>(IIII)V

    new-instance v3, Lcom/vkontakte/android/fragments/documents/DocumentsByTypeFragment$1;

    invoke-direct {v3, p0, p0}, Lcom/vkontakte/android/fragments/documents/DocumentsByTypeFragment$1;-><init>(Lcom/vkontakte/android/fragments/documents/DocumentsByTypeFragment;Landroid/app/Fragment;)V

    invoke-virtual {v2, v3}, Lcom/vkontakte/android/api/docs/DocsGet;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v2

    .line 91
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/documents/DocumentsByTypeFragment;->getActivity()Landroid/app/Activity;

    move-result-object v3

    invoke-virtual {v2, v3}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v2

    iput-object v2, p0, Lcom/vkontakte/android/fragments/documents/DocumentsByTypeFragment;->currentRequest:Lme/grishka/appkit/api/APIRequest;

    .line 93
    .end local v0    # "ownerID":I
    .end local v1    # "typeID":I
    :cond_0
    return-void
.end method

.method protected getAdapter()Landroid/support/v7/widget/RecyclerView$Adapter;
    .locals 1

    .prologue
    .line 97
    iget-object v0, p0, Lcom/vkontakte/android/fragments/documents/DocumentsByTypeFragment;->docsAdapter:Lcom/vkontakte/android/fragments/documents/DocumentsByTypeFragment$DocsAdapter;

    return-object v0
.end method

.method synthetic lambda$confirmAndDelete$1(Lcom/vkontakte/android/api/Document;Landroid/content/DialogInterface;I)V
    .locals 0
    .param p1, "doc"    # Lcom/vkontakte/android/api/Document;
    .param p2, "dialog"    # Landroid/content/DialogInterface;
    .param p3, "which"    # I

    .prologue
    .line 145
    invoke-direct {p0, p1}, Lcom/vkontakte/android/fragments/documents/DocumentsByTypeFragment;->doDelete(Lcom/vkontakte/android/api/Document;)V

    .line 146
    return-void
.end method

.method synthetic lambda$onDocumentLongClick$0(Lcom/vkontakte/android/api/Document;Landroid/content/DialogInterface;I)V
    .locals 3
    .param p1, "doc"    # Lcom/vkontakte/android/api/Document;
    .param p2, "dialog"    # Landroid/content/DialogInterface;
    .param p3, "which"    # I

    .prologue
    .line 128
    packed-switch p3, :pswitch_data_0

    .line 136
    :goto_0
    return-void

    .line 130
    :pswitch_0
    new-instance v0, Landroid/content/Intent;

    const-string/jumbo v1, "android.intent.action.VIEW"

    iget-object v2, p1, Lcom/vkontakte/android/api/Document;->url:Ljava/lang/String;

    invoke-static {v2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/documents/DocumentsByTypeFragment;->startActivity(Landroid/content/Intent;)V

    goto :goto_0

    .line 133
    :pswitch_1
    invoke-direct {p0, p1}, Lcom/vkontakte/android/fragments/documents/DocumentsByTypeFragment;->confirmAndDelete(Lcom/vkontakte/android/api/Document;)V

    goto :goto_0

    .line 128
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method onDocumentClick(Lcom/vkontakte/android/api/Document;)V
    .locals 9
    .param p1, "doc"    # Lcom/vkontakte/android/api/Document;

    .prologue
    .line 101
    iget-object v2, p1, Lcom/vkontakte/android/api/Document;->thumb:Ljava/lang/String;

    .line 102
    .local v2, "thumb":Ljava/lang/String;
    if-eqz v2, :cond_1

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v4

    if-lez v4, :cond_1

    .line 103
    invoke-virtual {p1}, Lcom/vkontakte/android/api/Document;->getExt()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v4

    const-string/jumbo v5, "gif"

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 104
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/documents/DocumentsByTypeFragment;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-static {v4}, Lcom/vkontakte/android/utils/Utils;->castToActivity(Landroid/content/Context;)Landroid/app/Activity;

    move-result-object v4

    invoke-static {v4, p1}, Lcom/vkontakte/android/gifs/GifViewer;->start(Landroid/app/Activity;Lcom/vkontakte/android/api/Document;)Lcom/vkontakte/android/gifs/GifViewer;

    .line 118
    :goto_0
    return-void

    .line 106
    :cond_0
    new-instance v4, Lcom/vkontakte/android/PhotoViewer;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/documents/DocumentsByTypeFragment;->getActivity()Landroid/app/Activity;

    move-result-object v5

    iget-object v6, p1, Lcom/vkontakte/android/api/Document;->url:Ljava/lang/String;

    iget-object v7, p1, Lcom/vkontakte/android/api/Document;->title:Ljava/lang/String;

    invoke-direct {v4, v5, v6, v7}, Lcom/vkontakte/android/PhotoViewer;-><init>(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v4}, Lcom/vkontakte/android/PhotoViewer;->show()V

    goto :goto_0

    .line 109
    :cond_1
    iget-object v4, p1, Lcom/vkontakte/android/api/Document;->url:Ljava/lang/String;

    invoke-static {v4}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    .line 110
    .local v3, "uri":Landroid/net/Uri;
    new-instance v1, Landroid/app/DownloadManager$Request;

    invoke-direct {v1, v3}, Landroid/app/DownloadManager$Request;-><init>(Landroid/net/Uri;)V

    .line 111
    .local v1, "req":Landroid/app/DownloadManager$Request;
    new-instance v5, Ljava/io/File;

    sget-object v4, Landroid/os/Environment;->DIRECTORY_DOWNLOADS:Ljava/lang/String;

    invoke-static {v4}, Landroid/os/Environment;->getExternalStoragePublicDirectory(Ljava/lang/String;)Ljava/io/File;

    move-result-object v6

    .line 112
    invoke-virtual {p1}, Lcom/vkontakte/android/api/Document;->getTitle()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-virtual {v3}, Landroid/net/Uri;->getLastPathSegment()Ljava/lang/String;

    move-result-object v4

    :goto_1
    invoke-direct {v5, v6, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 111
    invoke-static {v5}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v4

    invoke-virtual {v1, v4}, Landroid/app/DownloadManager$Request;->setDestinationUri(Landroid/net/Uri;)Landroid/app/DownloadManager$Request;

    .line 113
    const/4 v4, 0x1

    invoke-virtual {v1, v4}, Landroid/app/DownloadManager$Request;->setNotificationVisibility(I)Landroid/app/DownloadManager$Request;

    .line 114
    invoke-virtual {v1}, Landroid/app/DownloadManager$Request;->allowScanningByMediaScanner()V

    .line 115
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/documents/DocumentsByTypeFragment;->getActivity()Landroid/app/Activity;

    move-result-object v4

    const-string/jumbo v5, "download"

    invoke-virtual {v4, v5}, Landroid/app/Activity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/DownloadManager;

    .line 116
    .local v0, "mgr":Landroid/app/DownloadManager;
    invoke-virtual {v0, v1}, Landroid/app/DownloadManager;->enqueue(Landroid/app/DownloadManager$Request;)J

    goto :goto_0

    .line 112
    .end local v0    # "mgr":Landroid/app/DownloadManager;
    :cond_2
    invoke-virtual {p1}, Lcom/vkontakte/android/api/Document;->getTitle()Ljava/lang/String;

    move-result-object v4

    const/16 v7, 0x2f

    const/16 v8, 0x5f

    invoke-virtual {v4, v7, v8}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v4

    goto :goto_1
.end method

.method onDocumentLongClick(Lcom/vkontakte/android/api/Document;)Z
    .locals 6
    .param p1, "doc"    # Lcom/vkontakte/android/api/Document;

    .prologue
    const/4 v2, 0x1

    const/4 v1, 0x0

    .line 124
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/documents/DocumentsByTypeFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v3

    const-string/jumbo v4, "owner_id"

    invoke-virtual {v3, v4, v1}, Landroid/os/Bundle;->getInt(Ljava/lang/String;I)I

    move-result v0

    .line 125
    .local v0, "ownerID":I
    invoke-static {v0}, Lcom/vkontakte/android/auth/VKAccountManager;->isCurrentUser(I)Z

    move-result v3

    if-nez v3, :cond_0

    if-eqz v0, :cond_0

    if-gez v0, :cond_1

    neg-int v3, v0

    invoke-static {v3}, Lcom/vkontakte/android/data/Groups;->isGroupAdmin(I)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 126
    :cond_0
    new-instance v3, Lcom/vkontakte/android/VKAlertDialog$Builder;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/documents/DocumentsByTypeFragment;->getActivity()Landroid/app/Activity;

    move-result-object v4

    invoke-direct {v3, v4}, Lcom/vkontakte/android/VKAlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/String;

    const v5, 0x7f0801c6

    .line 127
    invoke-virtual {p0, v5}, Lcom/vkontakte/android/fragments/documents/DocumentsByTypeFragment;->getString(I)Ljava/lang/String;

    move-result-object v5

    aput-object v5, v4, v1

    const v1, 0x7f08019c

    invoke-virtual {p0, v1}, Lcom/vkontakte/android/fragments/documents/DocumentsByTypeFragment;->getString(I)Ljava/lang/String;

    move-result-object v1

    aput-object v1, v4, v2

    invoke-static {p0, p1}, Lcom/vkontakte/android/fragments/documents/DocumentsByTypeFragment$$Lambda$1;->lambdaFactory$(Lcom/vkontakte/android/fragments/documents/DocumentsByTypeFragment;Lcom/vkontakte/android/api/Document;)Landroid/content/DialogInterface$OnClickListener;

    move-result-object v1

    invoke-virtual {v3, v4, v1}, Lcom/vkontakte/android/VKAlertDialog$Builder;->setItems([Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 136
    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    move v1, v2

    .line 139
    :cond_1
    return v1
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 5
    .param p1, "view"    # Landroid/view/View;
    .param p2, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 64
    invoke-super {p0, p1, p2}, Lcom/vkontakte/android/fragments/VKRecyclerFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    .line 65
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/documents/DocumentsByTypeFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v3

    const-string/jumbo v4, "preloaded_docs"

    invoke-virtual {v3, v4}, Landroid/os/Bundle;->getParcelableArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v1

    .line 66
    .local v1, "list":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/os/Parcelable;>;"
    if-eqz v1, :cond_1

    .line 67
    new-instance v0, Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v3

    invoke-direct {v0, v3}, Ljava/util/ArrayList;-><init>(I)V

    .line 68
    .local v0, "documents":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/api/Document;>;"
    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/os/Parcelable;

    .line 69
    .local v2, "p":Landroid/os/Parcelable;
    check-cast v2, Lcom/vkontakte/android/api/Document;

    .end local v2    # "p":Landroid/os/Parcelable;
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 71
    :cond_0
    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/documents/DocumentsByTypeFragment;->onDataLoaded(Ljava/util/List;)V

    .line 73
    .end local v0    # "documents":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/api/Document;>;"
    :cond_1
    return-void
.end method

.method public updateListRemoveItem(I)V
    .locals 1
    .param p1, "position"    # I

    .prologue
    .line 161
    iget-object v0, p0, Lcom/vkontakte/android/fragments/documents/DocumentsByTypeFragment;->docsAdapter:Lcom/vkontakte/android/fragments/documents/DocumentsByTypeFragment$DocsAdapter;

    if-eqz v0, :cond_0

    if-ltz p1, :cond_0

    .line 162
    iget-object v0, p0, Lcom/vkontakte/android/fragments/documents/DocumentsByTypeFragment;->docsAdapter:Lcom/vkontakte/android/fragments/documents/DocumentsByTypeFragment$DocsAdapter;

    invoke-virtual {v0, p1}, Lcom/vkontakte/android/fragments/documents/DocumentsByTypeFragment$DocsAdapter;->notifyItemRemoved(I)V

    .line 164
    :cond_0
    return-void
.end method
