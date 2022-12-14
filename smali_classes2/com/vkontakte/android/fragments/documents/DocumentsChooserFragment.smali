.class public Lcom/vkontakte/android/fragments/documents/DocumentsChooserFragment;
.super Lcom/vkontakte/android/fragments/CardRecyclerFragment;
.source "DocumentsChooserFragment.java"

# interfaces
.implements Lcom/vk/attachpicker/SupportExternalToolbarContainer;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/fragments/documents/DocumentsChooserFragment$Adapter;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/fragments/CardRecyclerFragment",
        "<",
        "Ljava/util/List",
        "<",
        "Lcom/vkontakte/android/api/docs/DocsGetTypes$DocType;",
        ">;>;",
        "Lcom/vk/attachpicker/SupportExternalToolbarContainer;"
    }
.end annotation


# static fields
.field private static final FILE_RESULT:I = 0x67

.field private static final PHOTO_RESULT:I = 0x65


# instance fields
.field private adapter:Lcom/vkontakte/android/fragments/documents/DocumentsChooserFragment$Adapter;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 54
    const/16 v0, 0x32

    invoke-direct {p0, v0}, Lcom/vkontakte/android/fragments/CardRecyclerFragment;-><init>(I)V

    .line 47
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vkontakte/android/fragments/documents/DocumentsChooserFragment;->adapter:Lcom/vkontakte/android/fragments/documents/DocumentsChooserFragment$Adapter;

    .line 55
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/documents/DocumentsChooserFragment;->setRefreshEnabled(Z)V

    .line 56
    return-void
.end method

.method static synthetic access$000(Lcom/vkontakte/android/fragments/documents/DocumentsChooserFragment;)Lcom/vkontakte/android/fragments/documents/DocumentsChooserFragment$Adapter;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/documents/DocumentsChooserFragment;

    .prologue
    .line 42
    iget-object v0, p0, Lcom/vkontakte/android/fragments/documents/DocumentsChooserFragment;->adapter:Lcom/vkontakte/android/fragments/documents/DocumentsChooserFragment$Adapter;

    return-object v0
.end method

.method static synthetic access$100(Lcom/vkontakte/android/fragments/documents/DocumentsChooserFragment;Ljava/util/List;Z)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/documents/DocumentsChooserFragment;
    .param p1, "x1"    # Ljava/util/List;
    .param p2, "x2"    # Z

    .prologue
    .line 42
    invoke-virtual {p0, p1, p2}, Lcom/vkontakte/android/fragments/documents/DocumentsChooserFragment;->onDataLoaded(Ljava/util/List;Z)V

    return-void
.end method

.method static synthetic access$200(Lcom/vkontakte/android/fragments/documents/DocumentsChooserFragment;)Landroid/view/View;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/documents/DocumentsChooserFragment;

    .prologue
    .line 42
    iget-object v0, p0, Lcom/vkontakte/android/fragments/documents/DocumentsChooserFragment;->errorView:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$300(Lcom/vkontakte/android/fragments/documents/DocumentsChooserFragment;)Landroid/view/View;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/documents/DocumentsChooserFragment;

    .prologue
    .line 42
    iget-object v0, p0, Lcom/vkontakte/android/fragments/documents/DocumentsChooserFragment;->progress:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$402(Lcom/vkontakte/android/fragments/documents/DocumentsChooserFragment;Lme/grishka/appkit/api/APIRequest;)Lme/grishka/appkit/api/APIRequest;
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/documents/DocumentsChooserFragment;
    .param p1, "x1"    # Lme/grishka/appkit/api/APIRequest;

    .prologue
    .line 42
    iput-object p1, p0, Lcom/vkontakte/android/fragments/documents/DocumentsChooserFragment;->currentRequest:Lme/grishka/appkit/api/APIRequest;

    return-object p1
.end method

.method private isInContextOfAttachActivity()Z
    .locals 1

    .prologue
    .line 50
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/documents/DocumentsChooserFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    instance-of v0, v0, Lcom/vk/attachpicker/AttachActivity;

    return v0
.end method


# virtual methods
.method protected canGoBack()Z
    .locals 1

    .prologue
    .line 89
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/documents/DocumentsChooserFragment;->isInContextOfAttachActivity()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-super {p0}, Lcom/vkontakte/android/fragments/CardRecyclerFragment;->canGoBack()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public choiceDocFromGallery()V
    .locals 3

    .prologue
    .line 121
    new-instance v0, Landroid/content/Intent;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/documents/DocumentsChooserFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    const-class v2, Lcom/vk/attachpicker/PhotoVideoAttachActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 122
    .local v0, "intent":Landroid/content/Intent;
    const-string/jumbo v1, "selection_limit"

    const/16 v2, 0xa

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 123
    const-string/jumbo v1, "prevent_styling"

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 124
    const-string/jumbo v1, "media_type"

    const/16 v2, 0x6f

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 125
    const/16 v1, 0x65

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/fragments/documents/DocumentsChooserFragment;->startActivityForResult(Landroid/content/Intent;I)V

    .line 126
    return-void
.end method

.method public choiceDocFromStorage()V
    .locals 4

    .prologue
    .line 129
    new-instance v0, Lcom/vkontakte/android/fragments/utils/FilePickerFragment$Builder;

    invoke-direct {v0}, Lcom/vkontakte/android/fragments/utils/FilePickerFragment$Builder;-><init>()V

    const-wide/32 v2, 0xc800000

    invoke-virtual {v0, v2, v3}, Lcom/vkontakte/android/fragments/utils/FilePickerFragment$Builder;->setSizeLimit(J)Lcom/vkontakte/android/fragments/utils/FilePickerFragment$Builder;

    move-result-object v0

    const/16 v1, 0x67

    invoke-virtual {v0, p0, v1}, Lcom/vkontakte/android/fragments/utils/FilePickerFragment$Builder;->forResult(Landroid/app/Fragment;I)Z

    .line 130
    return-void
.end method

.method protected doLoadData(II)V
    .locals 3
    .param p1, "offset"    # I
    .param p2, "count"    # I

    .prologue
    .line 100
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/documents/DocumentsChooserFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v1

    const-string/jumbo v2, "owner_id"

    invoke-virtual {v1, v2}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v0

    .line 101
    .local v0, "ownerId":I
    new-instance v1, Lcom/vkontakte/android/api/docs/DocsGetTypes;

    invoke-direct {v1, v0}, Lcom/vkontakte/android/api/docs/DocsGetTypes;-><init>(I)V

    new-instance v2, Lcom/vkontakte/android/fragments/documents/DocumentsChooserFragment$1;

    invoke-direct {v2, p0}, Lcom/vkontakte/android/fragments/documents/DocumentsChooserFragment$1;-><init>(Lcom/vkontakte/android/fragments/documents/DocumentsChooserFragment;)V

    .line 102
    invoke-virtual {v1, v2}, Lcom/vkontakte/android/api/docs/DocsGetTypes;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v1

    iget-object v2, p0, Lcom/vkontakte/android/fragments/documents/DocumentsChooserFragment;->contentView:Landroid/view/ViewGroup;

    .line 117
    invoke-virtual {v1, v2}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/view/View;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v1

    iput-object v1, p0, Lcom/vkontakte/android/fragments/documents/DocumentsChooserFragment;->currentRequest:Lme/grishka/appkit/api/APIRequest;

    .line 118
    return-void
.end method

.method protected bridge synthetic getAdapter()Landroid/support/v7/widget/RecyclerView$Adapter;
    .locals 1

    .prologue
    .line 42
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/documents/DocumentsChooserFragment;->getAdapter()Lcom/vkontakte/android/fragments/documents/DocumentsChooserFragment$Adapter;

    move-result-object v0

    return-object v0
.end method

.method protected getAdapter()Lcom/vkontakte/android/fragments/documents/DocumentsChooserFragment$Adapter;
    .locals 1

    .prologue
    .line 60
    iget-object v0, p0, Lcom/vkontakte/android/fragments/documents/DocumentsChooserFragment;->adapter:Lcom/vkontakte/android/fragments/documents/DocumentsChooserFragment$Adapter;

    if-nez v0, :cond_0

    .line 61
    new-instance v0, Lcom/vkontakte/android/fragments/documents/DocumentsChooserFragment$Adapter;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/fragments/documents/DocumentsChooserFragment$Adapter;-><init>(Lcom/vkontakte/android/fragments/documents/DocumentsChooserFragment;)V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/documents/DocumentsChooserFragment;->adapter:Lcom/vkontakte/android/fragments/documents/DocumentsChooserFragment$Adapter;

    .line 63
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/fragments/documents/DocumentsChooserFragment;->adapter:Lcom/vkontakte/android/fragments/documents/DocumentsChooserFragment$Adapter;

    return-object v0
.end method

.method public hasNavigationDrawer()Z
    .locals 1

    .prologue
    .line 95
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/documents/DocumentsChooserFragment;->isInContextOfAttachActivity()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-super {p0}, Lcom/vkontakte/android/fragments/CardRecyclerFragment;->hasNavigationDrawer()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 18
    .param p1, "reqCode"    # I
    .param p2, "resCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    .line 133
    const/4 v2, -0x1

    move/from16 v0, p2

    if-ne v0, v2, :cond_0

    .line 134
    new-instance v10, Ljava/util/ArrayList;

    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    .line 136
    .local v10, "docs":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/attachments/PendingDocumentAttachment;>;"
    const/16 v2, 0x65

    move/from16 v0, p1

    if-ne v0, v2, :cond_4

    .line 137
    const-string/jumbo v2, "result_attachments"

    move-object/from16 v0, p3

    invoke-virtual {v0, v2}, Landroid/content/Intent;->getBundleExtra(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v15

    .line 138
    .local v15, "resultBundle":Landroid/os/Bundle;
    if-eqz v15, :cond_5

    .line 139
    const-string/jumbo v2, "result_files"

    invoke-virtual {v15, v2}, Landroid/os/Bundle;->getParcelableArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v12

    .line 140
    .local v12, "files":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/net/Uri;>;"
    if-nez v12, :cond_1

    .line 165
    .end local v10    # "docs":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/attachments/PendingDocumentAttachment;>;"
    .end local v12    # "files":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/net/Uri;>;"
    .end local v15    # "resultBundle":Landroid/os/Bundle;
    :cond_0
    :goto_0
    return-void

    .line 143
    .restart local v10    # "docs":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/attachments/PendingDocumentAttachment;>;"
    .restart local v12    # "files":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/net/Uri;>;"
    .restart local v15    # "resultBundle":Landroid/os/Bundle;
    :cond_1
    invoke-virtual {v12}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v17

    :cond_2
    :goto_1
    invoke-interface/range {v17 .. v17}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_5

    invoke-interface/range {v17 .. v17}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Landroid/net/Uri;

    .line 144
    .local v16, "uri":Landroid/net/Uri;
    const-string/jumbo v2, "file"

    invoke-virtual/range {v16 .. v16}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_3

    const-string/jumbo v2, "content"

    invoke-virtual/range {v16 .. v16}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 147
    :cond_3
    new-instance v2, Ljava/io/File;

    invoke-virtual/range {v16 .. v16}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/io/File;->length()J

    move-result-wide v2

    long-to-int v5, v2

    .line 148
    .local v5, "size":I
    invoke-virtual/range {v16 .. v16}, Landroid/net/Uri;->getLastPathSegment()Ljava/lang/String;

    move-result-object v2

    const-string/jumbo v3, "\\."

    invoke-virtual {v2, v3}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v11

    .line 149
    .local v11, "ext":[Ljava/lang/String;
    new-instance v2, Lcom/vkontakte/android/attachments/PendingDocumentAttachment;

    invoke-virtual/range {v16 .. v16}, Landroid/net/Uri;->getLastPathSegment()Ljava/lang/String;

    move-result-object v3

    invoke-virtual/range {v16 .. v16}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual/range {v16 .. v16}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v6

    const/4 v7, 0x0

    invoke-static {}, Lcom/vkontakte/android/upload/Upload;->getNewID()I

    move-result v8

    array-length v9, v11

    add-int/lit8 v9, v9, -0x1

    aget-object v9, v11, v9

    invoke-direct/range {v2 .. v9}, Lcom/vkontakte/android/attachments/PendingDocumentAttachment;-><init>(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;IILjava/lang/String;)V

    invoke-virtual {v10, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 152
    .end local v5    # "size":I
    .end local v11    # "ext":[Ljava/lang/String;
    .end local v12    # "files":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/net/Uri;>;"
    .end local v15    # "resultBundle":Landroid/os/Bundle;
    .end local v16    # "uri":Landroid/net/Uri;
    :cond_4
    const/16 v2, 0x67

    move/from16 v0, p1

    if-ne v0, v2, :cond_5

    .line 153
    const-string/jumbo v2, "files"

    move-object/from16 v0, p3

    invoke-virtual {v0, v2}, Landroid/content/Intent;->getParcelableArrayListExtra(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_2
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_5

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Landroid/os/Parcelable;

    .line 154
    .local v13, "p":Landroid/os/Parcelable;
    check-cast v13, Lcom/vkontakte/android/attachments/PendingDocumentAttachment;

    .end local v13    # "p":Landroid/os/Parcelable;
    invoke-virtual {v10, v13}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 158
    :cond_5
    invoke-virtual {v10}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_0

    .line 159
    new-instance v14, Landroid/content/Intent;

    invoke-direct {v14}, Landroid/content/Intent;-><init>()V

    .line 160
    .local v14, "result":Landroid/content/Intent;
    const-string/jumbo v2, "documents"

    invoke-virtual {v14, v2, v10}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 161
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/fragments/documents/DocumentsChooserFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    const/4 v3, -0x1

    invoke-virtual {v2, v3, v14}, Landroid/app/Activity;->setResult(ILandroid/content/Intent;)V

    .line 162
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/fragments/documents/DocumentsChooserFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/Activity;->finish()V

    goto/16 :goto_0
.end method

.method public onAttach(Landroid/app/Activity;)V
    .locals 1
    .param p1, "act"    # Landroid/app/Activity;

    .prologue
    .line 67
    invoke-super {p0, p1}, Lcom/vkontakte/android/fragments/CardRecyclerFragment;->onAttach(Landroid/app/Activity;)V

    .line 68
    const v0, 0x7f0801be

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/documents/DocumentsChooserFragment;->setTitle(I)V

    .line 69
    const v0, 0x7f08043a

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/documents/DocumentsChooserFragment;->setEmptyText(I)V

    .line 70
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/documents/DocumentsChooserFragment;->setHasOptionsMenu(Z)V

    .line 71
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/documents/DocumentsChooserFragment;->loadData()V

    .line 72
    return-void
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 2
    .param p1, "view"    # Landroid/view/View;
    .param p2, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 76
    invoke-super {p0, p1, p2}, Lcom/vkontakte/android/fragments/CardRecyclerFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    .line 77
    iget-object v0, p0, Lcom/vkontakte/android/fragments/documents/DocumentsChooserFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    const v1, -0x141210

    invoke-virtual {v0, v1}, Lme/grishka/appkit/views/UsableRecyclerView;->setBackgroundColor(I)V

    .line 79
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/documents/DocumentsChooserFragment;->isInContextOfAttachActivity()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 80
    const/4 v0, -0x1

    invoke-virtual {p1, v0}, Landroid/view/View;->setBackgroundColor(I)V

    .line 81
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/documents/DocumentsChooserFragment;->getToolbar()Landroid/support/v7/widget/Toolbar;

    move-result-object v0

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/support/v7/widget/Toolbar;->setVisibility(I)V

    .line 83
    :cond_0
    return-void
.end method

.method public provideToolbar(Landroid/content/Context;)Landroid/view/ViewGroup;
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 169
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/documents/DocumentsChooserFragment;->getToolbar()Landroid/support/v7/widget/Toolbar;

    move-result-object v0

    return-object v0
.end method
