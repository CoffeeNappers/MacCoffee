.class Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;
.super Ljava/lang/Object;
.source "NewPostFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Landroid/text/TextWatcher;
.implements Lcom/vkontakte/android/ui/AttachmentsEditorView$Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/news/NewPostFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "Presenter"
.end annotation


# static fields
.field static final AUDIO_RESULT:I = 0x4

.field static final DOCUMENT_RESULT:I = 0x6

.field static final LOCATION_RESULT:I = 0x3

.field static final MENTION_RESULT:I = 0x7

.field static final PHOTO_RESULT:I = 0x1

.field public static final POLL_RESULT:I = 0x8

.field static final VIDEO_EXISTING_RESULT:I = 0xb

.field static final VIDEO_NEW_RESULT:I = 0xa

.field static final VIDEO_RESULT:I = 0x5


# instance fields
.field changed:Z

.field exportToFacebook:Z

.field exportToTwitter:Z

.field friendsOnly:Z

.field fromGroup:Z

.field geoAttach:Lcom/vkontakte/android/attachments/GeoAttachment;

.field isComment:Z

.field isSuggest:Z

.field postponeTo:Ljava/util/Calendar;

.field publishing:Z

.field sigAttach:Lcom/vkontakte/android/attachments/Attachment;

.field signedFromGroup:Z

.field final synthetic this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/fragments/news/NewPostFragment;)V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 379
    iput-object p1, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 391
    iput-boolean v0, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->publishing:Z

    .line 392
    iput-boolean v0, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->fromGroup:Z

    .line 393
    iput-boolean v0, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->signedFromGroup:Z

    .line 396
    iput-boolean v0, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->isComment:Z

    .line 397
    iput-boolean v0, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->changed:Z

    .line 400
    iput-boolean v0, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->friendsOnly:Z

    .line 401
    iput-boolean v0, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->exportToTwitter:Z

    .line 402
    iput-boolean v0, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->exportToFacebook:Z

    return-void
.end method

.method synthetic constructor <init>(Lcom/vkontakte/android/fragments/news/NewPostFragment;Lcom/vkontakte/android/fragments/news/NewPostFragment$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/vkontakte/android/fragments/news/NewPostFragment;
    .param p2, "x1"    # Lcom/vkontakte/android/fragments/news/NewPostFragment$1;

    .prologue
    .line 379
    invoke-direct {p0, p1}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;-><init>(Lcom/vkontakte/android/fragments/news/NewPostFragment;)V

    return-void
.end method

.method private forbidAttachmentEditIfRequired()V
    .locals 2

    .prologue
    const/16 v1, 0x8

    .line 740
    iget-object v0, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    iget-boolean v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mForbidAttachmentsEdit:Z

    if-eqz v0, :cond_0

    .line 742
    iget-object v0, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->divider:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 743
    iget-object v0, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->bottomBar:Landroid/view/View;

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 745
    :cond_0
    return-void
.end method

.method static synthetic lambda$showOptions$15(Landroid/app/AlertDialog;[ZLandroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 4
    .param p0, "dlg"    # Landroid/app/AlertDialog;
    .param p1, "enabled"    # [Z
    .param p2, "v"    # Landroid/view/View;
    .param p3, "event"    # Landroid/view/MotionEvent;

    .prologue
    .line 1179
    invoke-virtual {p0}, Landroid/app/AlertDialog;->getListView()Landroid/widget/ListView;

    move-result-object v1

    invoke-virtual {p3}, Landroid/view/MotionEvent;->getX()F

    move-result v2

    float-to-int v2, v2

    invoke-virtual {p3}, Landroid/view/MotionEvent;->getY()F

    move-result v3

    float-to-int v3, v3

    invoke-virtual {v1, v2, v3}, Landroid/widget/ListView;->pointToPosition(II)I

    move-result v0

    .line 1180
    .local v0, "idx":I
    if-ltz v0, :cond_0

    array-length v1, p1

    if-ge v0, v1, :cond_0

    aget-boolean v1, p1, v0

    if-nez v1, :cond_0

    const/4 v1, 0x1

    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method


# virtual methods
.method public afterTextChanged(Landroid/text/Editable;)V
    .locals 0
    .param p1, "s"    # Landroid/text/Editable;

    .prologue
    .line 464
    invoke-static {p1}, Lcom/vkontakte/android/Global;->replaceEmoji(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    .line 465
    return-void
.end method

.method attachLocation(Lcom/vkontakte/android/attachments/GeoAttachment;)V
    .locals 2
    .param p1, "att"    # Lcom/vkontakte/android/attachments/GeoAttachment;

    .prologue
    .line 1220
    iput-object p1, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->geoAttach:Lcom/vkontakte/android/attachments/GeoAttachment;

    .line 1221
    iget-object v0, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mLocation:Landroid/widget/ImageView;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setSelected(Z)V

    .line 1222
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->updateBottomLine()V

    .line 1223
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->updateSendButton()V

    .line 1224
    return-void
.end method

.method public beforeTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0
    .param p1, "s"    # Ljava/lang/CharSequence;
    .param p2, "start"    # I
    .param p3, "count"    # I
    .param p4, "after"    # I

    .prologue
    .line 426
    return-void
.end method

.method checkAttachLimit()Z
    .locals 8

    .prologue
    const/16 v1, 0xa

    const/4 v0, 0x2

    const/4 v3, 0x1

    const/4 v2, 0x0

    .line 882
    iget-object v4, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    iget-object v4, v4, Lcom/vkontakte/android/fragments/news/NewPostFragment;->attachView:Lcom/vkontakte/android/ui/AttachmentsEditorView;

    invoke-virtual {v4}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->getCount()I

    move-result v5

    iget-boolean v4, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->isComment:Z

    if-eqz v4, :cond_0

    move v4, v0

    :goto_0
    if-lt v5, v4, :cond_2

    .line 883
    iget-object v4, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    invoke-virtual {v4}, Lcom/vkontakte/android/fragments/news/NewPostFragment;->getActivity()Landroid/app/Activity;

    move-result-object v4

    iget-object v5, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    invoke-virtual {v5}, Lcom/vkontakte/android/fragments/news/NewPostFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    const v6, 0x7f0800e0

    new-array v3, v3, [Ljava/lang/Object;

    iget-boolean v7, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->isComment:Z

    if-eqz v7, :cond_1

    :goto_1
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    aput-object v0, v3, v2

    invoke-virtual {v5, v6, v3}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v4, v0, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    move v0, v2

    .line 886
    :goto_2
    return v0

    :cond_0
    move v4, v1

    .line 882
    goto :goto_0

    :cond_1
    move v0, v1

    .line 883
    goto :goto_1

    :cond_2
    move v0, v3

    .line 886
    goto :goto_2
.end method

.method chooseVideo()V
    .locals 4

    .prologue
    .line 1002
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 1003
    .local v0, "args":Landroid/os/Bundle;
    const-string/jumbo v1, "select"

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 1004
    new-instance v1, Lcom/vkontakte/android/navigation/Navigator;

    const-class v2, Lcom/vkontakte/android/fragments/videos/VideosFragment;

    invoke-direct {v1, v2, v0}, Lcom/vkontakte/android/navigation/Navigator;-><init>(Ljava/lang/Class;Landroid/os/Bundle;)V

    iget-object v2, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    const/4 v3, 0x5

    invoke-virtual {v1, v2, v3}, Lcom/vkontakte/android/navigation/Navigator;->forResult(Landroid/app/Fragment;I)Z

    .line 1005
    return-void
.end method

.method synthetic lambda$null$1(Lcom/vkontakte/android/UserProfile;)V
    .locals 3
    .param p1, "signer"    # Lcom/vkontakte/android/UserProfile;

    .prologue
    .line 704
    iget-object v0, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mSignatureText:Landroid/widget/TextView;

    iget-object v1, p1, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 705
    new-instance v0, Lcom/vkontakte/android/attachments/SignatureLinkAttachment;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "https://vkontakte.ru/id"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p1, Lcom/vkontakte/android/UserProfile;->uid:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iget-object v2, p1, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    invoke-direct {v0, v1, v2}, Lcom/vkontakte/android/attachments/SignatureLinkAttachment;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->sigAttach:Lcom/vkontakte/android/attachments/Attachment;

    .line 706
    return-void
.end method

.method synthetic lambda$onActivityResult$4(ILandroid/content/Intent;)V
    .locals 22
    .param p1, "requestCode"    # I
    .param p2, "intent"    # Landroid/content/Intent;

    .prologue
    .line 760
    const/16 v17, 0xa

    move/from16 v0, p1

    move/from16 v1, v17

    if-eq v0, v1, :cond_0

    const/16 v17, 0xb

    move/from16 v0, p1

    move/from16 v1, v17

    if-ne v0, v1, :cond_3

    .line 761
    :cond_0
    const/4 v7, 0x0

    .line 763
    .local v7, "duration":I
    :try_start_0
    new-instance v10, Landroid/media/MediaMetadataRetriever;

    invoke-direct {v10}, Landroid/media/MediaMetadataRetriever;-><init>()V

    .line 764
    .local v10, "mdr":Landroid/media/MediaMetadataRetriever;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Lcom/vkontakte/android/fragments/news/NewPostFragment;->getActivity()Landroid/app/Activity;

    move-result-object v17

    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v18

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    invoke-virtual {v10, v0, v1}, Landroid/media/MediaMetadataRetriever;->setDataSource(Landroid/content/Context;Landroid/net/Uri;)V

    .line 765
    const/16 v17, 0x9

    move/from16 v0, v17

    invoke-virtual {v10, v0}, Landroid/media/MediaMetadataRetriever;->extractMetadata(I)Ljava/lang/String;

    move-result-object v17

    invoke-static/range {v17 .. v17}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v17

    move/from16 v0, v17

    div-int/lit16 v7, v0, 0x3e8

    .line 766
    invoke-virtual {v10}, Landroid/media/MediaMetadataRetriever;->release()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 770
    .end local v10    # "mdr":Landroid/media/MediaMetadataRetriever;
    :goto_0
    new-instance v15, Lcom/vkontakte/android/api/VideoFile;

    invoke-direct {v15}, Lcom/vkontakte/android/api/VideoFile;-><init>()V

    .line 771
    .local v15, "vf":Lcom/vkontakte/android/api/VideoFile;
    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v14

    .line 772
    .local v14, "uri":Landroid/net/Uri;
    invoke-virtual {v14}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v17

    const-string/jumbo v18, "content"

    invoke-virtual/range {v17 .. v18}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-eqz v17, :cond_1

    .line 773
    invoke-static {v14}, Lcom/vkontakte/android/upload/UploadUtils;->resolvePath(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, v17

    iput-object v0, v15, Lcom/vkontakte/android/api/VideoFile;->urlExternal:Ljava/lang/String;

    .line 777
    :goto_1
    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v18, "file://"

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-static {v14}, Lcom/vkontakte/android/ui/WriteBar;->getRealPathFromURI(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v18

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, v17

    iput-object v0, v15, Lcom/vkontakte/android/api/VideoFile;->urlBigThumb:Ljava/lang/String;

    .line 778
    iget-object v0, v15, Lcom/vkontakte/android/api/VideoFile;->urlExternal:Ljava/lang/String;

    move-object/from16 v17, v0

    invoke-static/range {v17 .. v17}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v17

    if-eqz v17, :cond_2

    .line 779
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Lcom/vkontakte/android/fragments/news/NewPostFragment;->getActivity()Landroid/app/Activity;

    move-result-object v17

    const v18, 0x7f0801f9

    const/16 v19, 0x0

    invoke-static/range {v17 .. v19}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Landroid/widget/Toast;->show()V

    .line 853
    .end local v7    # "duration":I
    .end local v14    # "uri":Landroid/net/Uri;
    .end local v15    # "vf":Lcom/vkontakte/android/api/VideoFile;
    :goto_2
    return-void

    .line 767
    .restart local v7    # "duration":I
    :catch_0
    move-exception v16

    .line 768
    .local v16, "x":Ljava/lang/Exception;
    const-string/jumbo v17, "vk"

    const-string/jumbo v18, "Error getting video duration!"

    move-object/from16 v0, v17

    move-object/from16 v1, v18

    move-object/from16 v2, v16

    invoke-static {v0, v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    goto :goto_0

    .line 775
    .end local v16    # "x":Ljava/lang/Exception;
    .restart local v14    # "uri":Landroid/net/Uri;
    .restart local v15    # "vf":Lcom/vkontakte/android/api/VideoFile;
    :cond_1
    invoke-virtual {v14}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, v17

    iput-object v0, v15, Lcom/vkontakte/android/api/VideoFile;->urlExternal:Ljava/lang/String;

    goto :goto_1

    .line 782
    :cond_2
    iput v7, v15, Lcom/vkontakte/android/api/VideoFile;->duration:I

    .line 783
    const-string/jumbo v17, "file"

    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v18

    invoke-virtual/range {v18 .. v18}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v18

    invoke-virtual/range {v17 .. v18}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v17

    if-eqz v17, :cond_8

    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Landroid/net/Uri;->getLastPathSegment()Ljava/lang/String;

    move-result-object v17

    :goto_3
    move-object/from16 v0, v17

    iput-object v0, v15, Lcom/vkontakte/android/api/VideoFile;->title:Ljava/lang/String;

    .line 784
    invoke-static {}, Lcom/vkontakte/android/upload/Upload;->getNewID()I

    move-result v17

    move/from16 v0, v17

    iput v0, v15, Lcom/vkontakte/android/api/VideoFile;->vid:I

    .line 785
    new-instance v13, Lcom/vkontakte/android/attachments/PendingVideoAttachment;

    invoke-direct {v13, v15}, Lcom/vkontakte/android/attachments/PendingVideoAttachment;-><init>(Lcom/vkontakte/android/api/VideoFile;)V

    .line 786
    .local v13, "pva":Lcom/vkontakte/android/attachments/PendingVideoAttachment;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->attachView:Lcom/vkontakte/android/ui/AttachmentsEditorView;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    invoke-virtual {v0, v13}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->add(Lcom/vkontakte/android/attachments/Attachment;)V

    .line 787
    const/16 v17, 0x1

    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->showAttachView(Z)V

    .line 789
    .end local v7    # "duration":I
    .end local v13    # "pva":Lcom/vkontakte/android/attachments/PendingVideoAttachment;
    .end local v14    # "uri":Landroid/net/Uri;
    .end local v15    # "vf":Lcom/vkontakte/android/api/VideoFile;
    :cond_3
    const/16 v17, 0x1

    move/from16 v0, p1

    move/from16 v1, v17

    if-ne v0, v1, :cond_5

    .line 790
    const-string/jumbo v17, "attachment"

    move-object/from16 v0, p2

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v17

    if-eqz v17, :cond_9

    .line 791
    const-string/jumbo v17, "attachment"

    move-object/from16 v0, p2

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v4

    check-cast v4, Lcom/vkontakte/android/attachments/PhotoAttachment;

    .line 792
    .local v4, "att":Lcom/vkontakte/android/attachments/PhotoAttachment;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->attachView:Lcom/vkontakte/android/ui/AttachmentsEditorView;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    invoke-virtual {v0, v4}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->add(Lcom/vkontakte/android/attachments/Attachment;)V

    .line 801
    .end local v4    # "att":Lcom/vkontakte/android/attachments/PhotoAttachment;
    :cond_4
    :goto_4
    const/16 v17, 0x1

    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->showAttachView(Z)V

    .line 803
    :cond_5
    const/16 v17, 0x4

    move/from16 v0, p1

    move/from16 v1, v17

    if-ne v0, v1, :cond_6

    .line 804
    const-string/jumbo v17, "audio"

    move-object/from16 v0, p2

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v3

    check-cast v3, Lcom/vkontakte/android/audio/MusicTrack;

    .line 805
    .local v3, "af":Lcom/vkontakte/android/audio/MusicTrack;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->attachView:Lcom/vkontakte/android/ui/AttachmentsEditorView;

    move-object/from16 v17, v0

    new-instance v18, Lcom/vkontakte/android/attachments/AudioAttachment;

    move-object/from16 v0, v18

    invoke-direct {v0, v3}, Lcom/vkontakte/android/attachments/AudioAttachment;-><init>(Lcom/vkontakte/android/audio/MusicTrack;)V

    invoke-virtual/range {v17 .. v18}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->add(Lcom/vkontakte/android/attachments/Attachment;)V

    .line 806
    const/16 v17, 0x1

    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->showAttachView(Z)V

    .line 808
    .end local v3    # "af":Lcom/vkontakte/android/audio/MusicTrack;
    :cond_6
    const/16 v17, 0x5

    move/from16 v0, p1

    move/from16 v1, v17

    if-ne v0, v1, :cond_7

    .line 809
    const-string/jumbo v17, "video"

    move-object/from16 v0, p2

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v15

    check-cast v15, Lcom/vkontakte/android/api/VideoFile;

    .line 810
    .restart local v15    # "vf":Lcom/vkontakte/android/api/VideoFile;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->attachView:Lcom/vkontakte/android/ui/AttachmentsEditorView;

    move-object/from16 v17, v0

    new-instance v18, Lcom/vkontakte/android/attachments/VideoAttachment;

    move-object/from16 v0, v18

    invoke-direct {v0, v15}, Lcom/vkontakte/android/attachments/VideoAttachment;-><init>(Lcom/vkontakte/android/api/VideoFile;)V

    invoke-virtual/range {v17 .. v18}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->add(Lcom/vkontakte/android/attachments/Attachment;)V

    .line 811
    const/16 v17, 0x1

    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->showAttachView(Z)V

    .line 813
    .end local v15    # "vf":Lcom/vkontakte/android/api/VideoFile;
    :cond_7
    const/16 v17, 0x6

    move/from16 v0, p1

    move/from16 v1, v17

    if-ne v0, v1, :cond_c

    .line 814
    const-string/jumbo v17, "documents"

    move-object/from16 v0, p2

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getParcelableArrayListExtra(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v6

    .line 815
    .local v6, "docs":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/os/Parcelable;>;"
    invoke-virtual {v6}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v17

    :goto_5
    invoke-interface/range {v17 .. v17}, Ljava/util/Iterator;->hasNext()Z

    move-result v18

    if-eqz v18, :cond_b

    invoke-interface/range {v17 .. v17}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Landroid/os/Parcelable;

    .line 816
    .local v11, "p":Landroid/os/Parcelable;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->attachView:Lcom/vkontakte/android/ui/AttachmentsEditorView;

    move-object/from16 v18, v0

    check-cast v11, Lcom/vkontakte/android/attachments/Attachment;

    .end local v11    # "p":Landroid/os/Parcelable;
    move-object/from16 v0, v18

    invoke-virtual {v0, v11}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->add(Lcom/vkontakte/android/attachments/Attachment;)V

    goto :goto_5

    .line 783
    .end local v6    # "docs":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/os/Parcelable;>;"
    .restart local v7    # "duration":I
    .restart local v14    # "uri":Landroid/net/Uri;
    .restart local v15    # "vf":Lcom/vkontakte/android/api/VideoFile;
    :cond_8
    new-instance v17, Ljava/lang/StringBuilder;

    invoke-direct/range {v17 .. v17}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v18, "file://"

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {p2 .. p2}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v18

    invoke-static/range {v18 .. v18}, Lcom/vkontakte/android/upload/UploadUtils;->resolvePath(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object v18

    invoke-virtual/range {v17 .. v18}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    invoke-static/range {v17 .. v17}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Landroid/net/Uri;->getLastPathSegment()Ljava/lang/String;

    move-result-object v17

    goto/16 :goto_3

    .line 793
    .end local v7    # "duration":I
    .end local v14    # "uri":Landroid/net/Uri;
    .end local v15    # "vf":Lcom/vkontakte/android/api/VideoFile;
    :cond_9
    const-string/jumbo v17, "files"

    move-object/from16 v0, p2

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v17

    if-eqz v17, :cond_a

    .line 794
    const-string/jumbo v17, "files"

    move-object/from16 v0, p2

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringArrayListExtra(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v9

    .line 795
    .local v9, "files":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    invoke-virtual {v9}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v17

    :goto_6
    invoke-interface/range {v17 .. v17}, Ljava/util/Iterator;->hasNext()Z

    move-result v18

    if-eqz v18, :cond_4

    invoke-interface/range {v17 .. v17}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    .line 796
    .local v8, "file":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->attachView:Lcom/vkontakte/android/ui/AttachmentsEditorView;

    move-object/from16 v18, v0

    new-instance v19, Lcom/vkontakte/android/attachments/PendingPhotoAttachment;

    move-object/from16 v0, v19

    invoke-direct {v0, v8}, Lcom/vkontakte/android/attachments/PendingPhotoAttachment;-><init>(Ljava/lang/String;)V

    invoke-virtual/range {v18 .. v19}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->add(Lcom/vkontakte/android/attachments/Attachment;)V

    goto :goto_6

    .line 799
    .end local v8    # "file":Ljava/lang/String;
    .end local v9    # "files":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    :cond_a
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->attachView:Lcom/vkontakte/android/ui/AttachmentsEditorView;

    move-object/from16 v17, v0

    new-instance v18, Lcom/vkontakte/android/attachments/PendingPhotoAttachment;

    const-string/jumbo v19, "file"

    move-object/from16 v0, p2

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v19

    invoke-direct/range {v18 .. v19}, Lcom/vkontakte/android/attachments/PendingPhotoAttachment;-><init>(Ljava/lang/String;)V

    invoke-virtual/range {v17 .. v18}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->add(Lcom/vkontakte/android/attachments/Attachment;)V

    goto/16 :goto_4

    .line 818
    .restart local v6    # "docs":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/os/Parcelable;>;"
    :cond_b
    const/16 v17, 0x1

    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->showAttachView(Z)V

    .line 820
    .end local v6    # "docs":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/os/Parcelable;>;"
    :cond_c
    const/16 v17, 0x7

    move/from16 v0, p1

    move/from16 v1, v17

    if-ne v0, v1, :cond_e

    .line 821
    const-string/jumbo v17, "user"

    move-object/from16 v0, p2

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v11

    check-cast v11, Lcom/vkontakte/android/UserProfile;

    .line 822
    .local v11, "p":Lcom/vkontakte/android/UserProfile;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mEdit:Lcom/vkontakte/android/NewsEntry;

    move-object/from16 v17, v0

    if-eqz v17, :cond_14

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mEdit:Lcom/vkontakte/android/NewsEntry;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    iget v0, v0, Lcom/vkontakte/android/NewsEntry;->type:I

    move/from16 v17, v0

    const/16 v18, 0xe

    move/from16 v0, v17

    move/from16 v1, v18

    if-eq v0, v1, :cond_d

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mEdit:Lcom/vkontakte/android/NewsEntry;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    iget v0, v0, Lcom/vkontakte/android/NewsEntry;->type:I

    move/from16 v17, v0

    const/16 v18, 0x11

    move/from16 v0, v17

    move/from16 v1, v18

    if-ne v0, v1, :cond_14

    .line 823
    :cond_d
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mStatusEdit:Landroid/widget/EditText;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Landroid/widget/EditText;->getSelectionEnd()I

    move-result v17

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mStatusEdit:Landroid/widget/EditText;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Landroid/widget/EditText;->getSelectionStart()I

    move-result v18

    move/from16 v0, v17

    move/from16 v1, v18

    if-eq v0, v1, :cond_12

    .line 824
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mStatusEdit:Landroid/widget/EditText;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v17

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mStatusEdit:Landroid/widget/EditText;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Landroid/widget/EditText;->getSelectionStart()I

    move-result v18

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mStatusEdit:Landroid/widget/EditText;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Landroid/widget/EditText;->getSelectionEnd()I

    move-result v19

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v21, "[id"

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    iget v0, v11, Lcom/vkontakte/android/UserProfile;->uid:I

    move/from16 v21, v0

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string/jumbo v21, "|"

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mStatusEdit:Landroid/widget/EditText;

    move-object/from16 v21, v0

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string/jumbo v21, "]"

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-interface/range {v17 .. v20}, Landroid/text/Editable;->replace(IILjava/lang/CharSequence;)Landroid/text/Editable;

    .line 836
    .end local v11    # "p":Lcom/vkontakte/android/UserProfile;
    :cond_e
    :goto_7
    const/16 v17, 0x8

    move/from16 v0, p1

    move/from16 v1, v17

    if-ne v0, v1, :cond_f

    .line 837
    const-string/jumbo v17, "poll"

    move-object/from16 v0, p2

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v12

    check-cast v12, Lcom/vkontakte/android/attachments/PollAttachment;

    .line 838
    .local v12, "poll":Lcom/vkontakte/android/attachments/PollAttachment;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->attachView:Lcom/vkontakte/android/ui/AttachmentsEditorView;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    invoke-virtual {v0, v12}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->add(Lcom/vkontakte/android/attachments/Attachment;)V

    .line 839
    const/16 v17, 0x1

    move-object/from16 v0, p0

    move/from16 v1, v17

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->showAttachView(Z)V

    .line 841
    .end local v12    # "poll":Lcom/vkontakte/android/attachments/PollAttachment;
    :cond_f
    const/16 v17, 0x9

    move/from16 v0, p1

    move/from16 v1, v17

    if-ne v0, v1, :cond_11

    .line 842
    const-string/jumbo v17, "poll"

    move-object/from16 v0, p2

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v12

    check-cast v12, Lcom/vkontakte/android/attachments/PollAttachment;

    .line 843
    .restart local v12    # "poll":Lcom/vkontakte/android/attachments/PollAttachment;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->attachView:Lcom/vkontakte/android/ui/AttachmentsEditorView;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    invoke-virtual {v0, v12}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->add(Lcom/vkontakte/android/attachments/Attachment;)V

    .line 844
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->attachView:Lcom/vkontakte/android/ui/AttachmentsEditorView;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->getAll()Ljava/util/ArrayList;

    move-result-object v5

    .line 845
    .local v5, "atts":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/attachments/Attachment;>;"
    invoke-virtual {v5}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v17

    :cond_10
    invoke-interface/range {v17 .. v17}, Ljava/util/Iterator;->hasNext()Z

    move-result v18

    if-eqz v18, :cond_11

    invoke-interface/range {v17 .. v17}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/vkontakte/android/attachments/Attachment;

    .line 846
    .local v4, "att":Lcom/vkontakte/android/attachments/Attachment;
    instance-of v0, v4, Lcom/vkontakte/android/attachments/PollAttachment;

    move/from16 v18, v0

    if-eqz v18, :cond_10

    if-eq v4, v12, :cond_10

    .line 847
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->attachView:Lcom/vkontakte/android/ui/AttachmentsEditorView;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    invoke-virtual {v0, v4}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->remove(Lcom/vkontakte/android/attachments/Attachment;)V

    .line 852
    .end local v4    # "att":Lcom/vkontakte/android/attachments/Attachment;
    .end local v5    # "atts":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/attachments/Attachment;>;"
    .end local v12    # "poll":Lcom/vkontakte/android/attachments/PollAttachment;
    :cond_11
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->updateSendButton()V

    goto/16 :goto_2

    .line 826
    .restart local v11    # "p":Lcom/vkontakte/android/UserProfile;
    :cond_12
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mStatusEdit:Landroid/widget/EditText;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v18

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mStatusEdit:Landroid/widget/EditText;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Landroid/widget/EditText;->getSelectionEnd()I

    move-result v19

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mStatusEdit:Landroid/widget/EditText;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Landroid/widget/EditText;->getSelectionStart()I

    move-result v17

    if-nez v17, :cond_13

    const-string/jumbo v17, ""

    :goto_8
    move-object/from16 v0, v20

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    const-string/jumbo v20, "[id"

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    iget v0, v11, Lcom/vkontakte/android/UserProfile;->uid:I

    move/from16 v20, v0

    move-object/from16 v0, v17

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v17

    const-string/jumbo v20, "|"

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    iget-object v0, v11, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    move-object/from16 v20, v0

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    const-string/jumbo v20, "] "

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, v18

    move/from16 v1, v19

    move-object/from16 v2, v17

    invoke-interface {v0, v1, v2}, Landroid/text/Editable;->insert(ILjava/lang/CharSequence;)Landroid/text/Editable;

    goto/16 :goto_7

    :cond_13
    const-string/jumbo v17, " "

    goto :goto_8

    .line 829
    :cond_14
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mStatusEdit:Landroid/widget/EditText;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Landroid/widget/EditText;->getSelectionEnd()I

    move-result v17

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mStatusEdit:Landroid/widget/EditText;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Landroid/widget/EditText;->getSelectionStart()I

    move-result v18

    move/from16 v0, v17

    move/from16 v1, v18

    if-eq v0, v1, :cond_15

    .line 830
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mStatusEdit:Landroid/widget/EditText;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v17

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    move-object/from16 v18, v0

    move-object/from16 v0, v18

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mStatusEdit:Landroid/widget/EditText;

    move-object/from16 v18, v0

    invoke-virtual/range {v18 .. v18}, Landroid/widget/EditText;->getSelectionStart()I

    move-result v18

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mStatusEdit:Landroid/widget/EditText;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Landroid/widget/EditText;->getSelectionEnd()I

    move-result v19

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v21, "*id"

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    iget v0, v11, Lcom/vkontakte/android/UserProfile;->uid:I

    move/from16 v21, v0

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string/jumbo v21, " ("

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mStatusEdit:Landroid/widget/EditText;

    move-object/from16 v21, v0

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v20

    const-string/jumbo v21, ")"

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-interface/range {v17 .. v20}, Landroid/text/Editable;->replace(IILjava/lang/CharSequence;)Landroid/text/Editable;

    goto/16 :goto_7

    .line 832
    :cond_15
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mStatusEdit:Landroid/widget/EditText;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v18

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mStatusEdit:Landroid/widget/EditText;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Landroid/widget/EditText;->getSelectionEnd()I

    move-result v19

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    move-object/from16 v17, v0

    move-object/from16 v0, v17

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mStatusEdit:Landroid/widget/EditText;

    move-object/from16 v17, v0

    invoke-virtual/range {v17 .. v17}, Landroid/widget/EditText;->getSelectionStart()I

    move-result v17

    if-nez v17, :cond_16

    const-string/jumbo v17, ""

    :goto_9
    move-object/from16 v0, v20

    move-object/from16 v1, v17

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    const-string/jumbo v20, "*id"

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    iget v0, v11, Lcom/vkontakte/android/UserProfile;->uid:I

    move/from16 v20, v0

    move-object/from16 v0, v17

    move/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v17

    const-string/jumbo v20, " ("

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    iget-object v0, v11, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    move-object/from16 v20, v0

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    const-string/jumbo v20, ") "

    move-object/from16 v0, v17

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v17

    invoke-virtual/range {v17 .. v17}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v17

    move-object/from16 v0, v18

    move/from16 v1, v19

    move-object/from16 v2, v17

    invoke-interface {v0, v1, v2}, Landroid/text/Editable;->insert(ILjava/lang/CharSequence;)Landroid/text/Editable;

    goto/16 :goto_7

    :cond_16
    const-string/jumbo v17, " "

    goto :goto_9
.end method

.method synthetic lambda$onBackPressed$5(Landroid/content/DialogInterface;I)V
    .locals 1
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 862
    iget-object v0, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/news/NewPostFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->finish()V

    .line 863
    return-void
.end method

.method synthetic lambda$onClick$0(Landroid/content/DialogInterface;I)V
    .locals 0
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 484
    packed-switch p2, :pswitch_data_0

    .line 494
    :goto_0
    return-void

    .line 486
    :pswitch_0
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->startLocationChooser()V

    goto :goto_0

    .line 490
    :pswitch_1
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->removeLocation()V

    goto :goto_0

    .line 484
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method synthetic lambda$setupInitialData$2(Ljava/util/ArrayList;)V
    .locals 3
    .param p1, "users"    # Ljava/util/ArrayList;

    .prologue
    .line 701
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lez v1, :cond_0

    .line 702
    const/4 v1, 0x0

    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/UserProfile;

    .line 703
    .local v0, "signer":Lcom/vkontakte/android/UserProfile;
    iget-object v1, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    iget-object v1, v1, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mSignatureText:Landroid/widget/TextView;

    invoke-static {p0, v0}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter$$Lambda$17;->lambdaFactory$(Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;Lcom/vkontakte/android/UserProfile;)Ljava/lang/Runnable;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->post(Ljava/lang/Runnable;)Z

    .line 708
    .end local v0    # "signer":Lcom/vkontakte/android/UserProfile;
    :cond_0
    return-void
.end method

.method synthetic lambda$setupInitialData$3()V
    .locals 1

    .prologue
    .line 728
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->changed:Z

    return-void
.end method

.method synthetic lambda$showExtendedAttachMenu$6(Landroid/content/DialogInterface;I)V
    .locals 1
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 915
    packed-switch p2, :pswitch_data_0

    .line 941
    :cond_0
    :goto_0
    return-void

    .line 917
    :pswitch_0
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->checkAttachLimit()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 920
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->startAudioSelector()V

    goto :goto_0

    .line 923
    :pswitch_1
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->checkAttachLimit()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 926
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->startVideoSelector()V

    goto :goto_0

    .line 929
    :pswitch_2
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->checkAttachLimit()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 932
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->startDocumentSelector()V

    goto :goto_0

    .line 935
    :pswitch_3
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->checkAttachLimit()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 938
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->startPollSelector()V

    goto :goto_0

    .line 915
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method

.method synthetic lambda$showOptions$10(Ljava/util/ArrayList;[Z[ZLandroid/content/DialogInterface;IZ)V
    .locals 7
    .param p1, "acts"    # Ljava/util/ArrayList;
    .param p2, "enabled"    # [Z
    .param p3, "opts"    # [Z
    .param p4, "dialog"    # Landroid/content/DialogInterface;
    .param p5, "which"    # I
    .param p6, "isChecked"    # Z

    .prologue
    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 1083
    const/4 v1, -0x1

    .line 1084
    .local v1, "w":I
    invoke-virtual {p1, p5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 1085
    .local v0, "s":Ljava/lang/String;
    const-string/jumbo v2, "friendsonly"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_a

    .line 1086
    const/4 v1, 0x0

    .line 1087
    const-string/jumbo v2, "twitter"

    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 1088
    const-string/jumbo v2, "twitter"

    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v5

    if-nez p6, :cond_4

    move v2, v3

    :goto_0
    aput-boolean v2, p2, v5

    .line 1089
    const-string/jumbo v2, "twitter"

    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v5

    if-nez p6, :cond_5

    move v2, v3

    :goto_1
    aput-boolean v2, p3, v5

    move-object v2, p4

    .line 1090
    check-cast v2, Landroid/app/AlertDialog;

    invoke-virtual {v2}, Landroid/app/AlertDialog;->getListView()Landroid/widget/ListView;

    move-result-object v5

    const-string/jumbo v2, "twitter"

    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v6

    if-nez p6, :cond_6

    move v2, v3

    :goto_2
    invoke-virtual {v5, v6, v2}, Landroid/widget/ListView;->setItemChecked(IZ)V

    .line 1092
    :cond_0
    const-string/jumbo v2, "fb"

    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 1093
    const-string/jumbo v2, "fb"

    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v5

    if-nez p6, :cond_7

    move v2, v3

    :goto_3
    aput-boolean v2, p2, v5

    .line 1094
    const-string/jumbo v2, "fb"

    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v5

    if-nez p6, :cond_8

    move v2, v3

    :goto_4
    aput-boolean v2, p3, v5

    move-object v2, p4

    .line 1095
    check-cast v2, Landroid/app/AlertDialog;

    invoke-virtual {v2}, Landroid/app/AlertDialog;->getListView()Landroid/widget/ListView;

    move-result-object v2

    const-string/jumbo v5, "fb"

    invoke-virtual {p1, v5}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v5

    if-nez p6, :cond_9

    :goto_5
    invoke-virtual {v2, v5, v3}, Landroid/widget/ListView;->setItemChecked(IZ)V

    .line 1097
    :cond_1
    check-cast p4, Landroid/app/AlertDialog;

    .end local p4    # "dialog":Landroid/content/DialogInterface;
    invoke-virtual {p4}, Landroid/app/AlertDialog;->getListView()Landroid/widget/ListView;

    move-result-object v2

    invoke-virtual {v2}, Landroid/widget/ListView;->getAdapter()Landroid/widget/ListAdapter;

    move-result-object v2

    check-cast v2, Landroid/widget/BaseAdapter;

    invoke-virtual {v2}, Landroid/widget/BaseAdapter;->notifyDataSetChanged()V

    .line 1107
    :cond_2
    :goto_6
    const/4 v2, -0x1

    if-eq v1, v2, :cond_3

    .line 1108
    aput-boolean p6, p3, v1

    .line 1110
    :cond_3
    return-void

    .restart local p4    # "dialog":Landroid/content/DialogInterface;
    :cond_4
    move v2, v4

    .line 1088
    goto :goto_0

    :cond_5
    move v2, v4

    .line 1089
    goto :goto_1

    :cond_6
    move v2, v4

    .line 1090
    goto :goto_2

    :cond_7
    move v2, v4

    .line 1093
    goto :goto_3

    :cond_8
    move v2, v4

    .line 1094
    goto :goto_4

    :cond_9
    move v3, v4

    .line 1095
    goto :goto_5

    .line 1098
    :cond_a
    const-string/jumbo v2, "twitter"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_b

    .line 1099
    const/4 v1, 0x1

    goto :goto_6

    .line 1100
    :cond_b
    const-string/jumbo v2, "fb"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_c

    .line 1101
    const/4 v1, 0x2

    goto :goto_6

    .line 1102
    :cond_c
    const-string/jumbo v2, "timer"

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 1103
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->showTimerDlg()V

    .line 1104
    iget-object v2, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    iget-object v5, v2, Lcom/vkontakte/android/fragments/news/NewPostFragment;->optionsAlertView:Landroid/widget/ListView;

    iget-object v2, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->postponeTo:Ljava/util/Calendar;

    if-eqz v2, :cond_d

    move v2, v3

    :goto_7
    invoke-virtual {v5, p5, v2}, Landroid/widget/ListView;->setItemChecked(IZ)V

    .line 1105
    iget-object v2, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->postponeTo:Ljava/util/Calendar;

    if-eqz v2, :cond_e

    :goto_8
    aput-boolean v3, p3, p5

    goto :goto_6

    :cond_d
    move v2, v4

    .line 1104
    goto :goto_7

    :cond_e
    move v3, v4

    .line 1105
    goto :goto_8
.end method

.method synthetic lambda$showOptions$11([ZLandroid/content/DialogInterface;I)V
    .locals 3
    .param p1, "opts"    # [Z
    .param p2, "dialog"    # Landroid/content/DialogInterface;
    .param p3, "which"    # I

    .prologue
    const/4 v2, 0x2

    const/4 v1, 0x1

    .line 1112
    const/4 v0, 0x0

    aget-boolean v0, p1, v0

    iput-boolean v0, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->friendsOnly:Z

    .line 1113
    aget-boolean v0, p1, v1

    iput-boolean v0, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->exportToTwitter:Z

    .line 1114
    aget-boolean v0, p1, v2

    iput-boolean v0, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->exportToFacebook:Z

    .line 1115
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->editCurrent()Lcom/vkontakte/android/auth/VKAccountEditor;

    move-result-object v0

    aget-boolean v1, p1, v1

    .line 1116
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/auth/VKAccountEditor;->setExportTwitterAvail(Z)Lcom/vkontakte/android/auth/VKAccountEditor;

    move-result-object v0

    aget-boolean v1, p1, v2

    .line 1117
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/auth/VKAccountEditor;->setExportFacebookAvail(Z)Lcom/vkontakte/android/auth/VKAccountEditor;

    move-result-object v0

    .line 1118
    invoke-virtual {v0}, Lcom/vkontakte/android/auth/VKAccountEditor;->commit()V

    .line 1119
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->updateExportIcons()V

    .line 1120
    return-void
.end method

.method synthetic lambda$showOptions$12(Landroid/content/DialogInterface;)V
    .locals 2
    .param p1, "dialog"    # Landroid/content/DialogInterface;

    .prologue
    .line 1125
    iget-object v0, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    const/4 v1, 0x0

    iput-object v1, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->optionsAlertView:Landroid/widget/ListView;

    return-void
.end method

.method synthetic lambda$showOptions$13([Z[ZLandroid/content/DialogInterface;IZ)V
    .locals 4
    .param p1, "enabled"    # [Z
    .param p2, "opts"    # [Z
    .param p3, "dialog"    # Landroid/content/DialogInterface;
    .param p4, "which"    # I
    .param p5, "isChecked"    # Z

    .prologue
    const/4 v3, 0x2

    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 1149
    if-nez p4, :cond_0

    .line 1150
    aput-boolean p5, p1, v3

    aput-boolean p5, p1, v1

    move-object v0, p3

    .line 1151
    check-cast v0, Landroid/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/AlertDialog;->getListView()Landroid/widget/ListView;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/ListView;->getAdapter()Landroid/widget/ListAdapter;

    move-result-object v0

    check-cast v0, Landroid/widget/BaseAdapter;

    invoke-virtual {v0}, Landroid/widget/BaseAdapter;->notifyDataSetChanged()V

    .line 1152
    if-nez p5, :cond_0

    .line 1153
    aput-boolean v2, p2, v1

    move-object v0, p3

    .line 1154
    check-cast v0, Landroid/app/AlertDialog;

    invoke-virtual {v0}, Landroid/app/AlertDialog;->getListView()Landroid/widget/ListView;

    move-result-object v0

    invoke-virtual {v0, v1, v2}, Landroid/widget/ListView;->setItemChecked(IZ)V

    .line 1155
    check-cast p3, Landroid/app/AlertDialog;

    .end local p3    # "dialog":Landroid/content/DialogInterface;
    invoke-virtual {p3}, Landroid/app/AlertDialog;->getListView()Landroid/widget/ListView;

    move-result-object v0

    invoke-virtual {v0, v3, v2}, Landroid/widget/ListView;->setItemChecked(IZ)V

    .line 1156
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->postponeTo:Ljava/util/Calendar;

    .line 1157
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->updateTimer()V

    .line 1160
    :cond_0
    if-ne p4, v3, :cond_3

    .line 1161
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->showTimerDlg()V

    .line 1162
    iget-object v0, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    iget-object v3, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->optionsAlertView:Landroid/widget/ListView;

    iget-object v0, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->postponeTo:Ljava/util/Calendar;

    if-eqz v0, :cond_1

    move v0, v1

    :goto_0
    invoke-virtual {v3, p4, v0}, Landroid/widget/ListView;->setItemChecked(IZ)V

    .line 1163
    iget-object v0, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->postponeTo:Ljava/util/Calendar;

    if-eqz v0, :cond_2

    :goto_1
    aput-boolean v1, p2, p4

    .line 1167
    :goto_2
    return-void

    :cond_1
    move v0, v2

    .line 1162
    goto :goto_0

    :cond_2
    move v1, v2

    .line 1163
    goto :goto_1

    .line 1166
    :cond_3
    aput-boolean p5, p2, p4

    goto :goto_2
.end method

.method synthetic lambda$showOptions$14([ZLandroid/content/DialogInterface;I)V
    .locals 3
    .param p1, "opts"    # [Z
    .param p2, "dialog"    # Landroid/content/DialogInterface;
    .param p3, "which"    # I

    .prologue
    const/4 v0, 0x0

    .line 1169
    aget-boolean v1, p1, v0

    iput-boolean v1, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->fromGroup:Z

    .line 1170
    const/4 v1, 0x1

    aget-boolean v1, p1, v1

    iput-boolean v1, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->signedFromGroup:Z

    .line 1171
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->updateExportIcons()V

    .line 1172
    iget-object v1, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    iget-object v1, v1, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mSignatureText:Landroid/widget/TextView;

    iget-boolean v2, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->signedFromGroup:Z

    if-eqz v2, :cond_0

    :goto_0
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setVisibility(I)V

    .line 1173
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->updateFieldSize()V

    .line 1174
    return-void

    .line 1172
    :cond_0
    const/16 v0, 0x8

    goto :goto_0
.end method

.method synthetic lambda$showOptions$16(Landroid/content/DialogInterface;)V
    .locals 2
    .param p1, "dialog"    # Landroid/content/DialogInterface;

    .prologue
    .line 1184
    iget-object v0, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    const/4 v1, 0x0

    iput-object v1, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->optionsAlertView:Landroid/widget/ListView;

    return-void
.end method

.method synthetic lambda$showTimerDlg$7(Ljava/util/Calendar;)V
    .locals 0
    .param p1, "date"    # Ljava/util/Calendar;

    .prologue
    .line 955
    iput-object p1, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->postponeTo:Ljava/util/Calendar;

    .line 956
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->updateTimer()V

    .line 957
    return-void
.end method

.method synthetic lambda$startLocationChooser$9(Landroid/content/DialogInterface;I)V
    .locals 3
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 1025
    iget-object v0, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    new-instance v1, Landroid/content/Intent;

    const-string/jumbo v2, "android.settings.LOCATION_SOURCE_SETTINGS"

    invoke-direct {v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/news/NewPostFragment;->startActivity(Landroid/content/Intent;)V

    .line 1026
    return-void
.end method

.method synthetic lambda$startVideoSelector$8(Landroid/content/DialogInterface;I)V
    .locals 4
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 978
    packed-switch p2, :pswitch_data_0

    .line 996
    :goto_0
    return-void

    .line 980
    :pswitch_0
    new-instance v0, Landroid/content/Intent;

    const-string/jumbo v1, "android.media.action.VIDEO_CAPTURE"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 981
    .local v0, "intent":Landroid/content/Intent;
    const-string/jumbo v1, "android.intent.extra.sizeLimit"

    const-wide v2, 0x80000000L

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;J)Landroid/content/Intent;

    .line 982
    iget-object v1, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    const/16 v2, 0xa

    invoke-virtual {v1, v0, v2}, Lcom/vkontakte/android/fragments/news/NewPostFragment;->startActivityForResult(Landroid/content/Intent;I)V

    goto :goto_0

    .line 986
    .end local v0    # "intent":Landroid/content/Intent;
    :pswitch_1
    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    invoke-virtual {v1}, Lcom/vkontakte/android/fragments/news/NewPostFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    const-class v2, Lcom/vk/attachpicker/PhotoVideoAttachActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 987
    .restart local v0    # "intent":Landroid/content/Intent;
    const-string/jumbo v1, "media_type"

    const/16 v2, 0x14d

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 988
    const-string/jumbo v1, "single_mode"

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 989
    iget-object v1, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    const/16 v2, 0xb

    invoke-virtual {v1, v0, v2}, Lcom/vkontakte/android/fragments/news/NewPostFragment;->startActivityForResult(Landroid/content/Intent;I)V

    goto :goto_0

    .line 993
    .end local v0    # "intent":Landroid/content/Intent;
    :pswitch_2
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->chooseVideo()V

    goto :goto_0

    .line 978
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method onActivityResult(IILandroid/content/Intent;)V
    .locals 4
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "intent"    # Landroid/content/Intent;

    .prologue
    .line 748
    const/4 v0, -0x1

    if-eq p2, v0, :cond_0

    .line 854
    :goto_0
    return-void

    .line 752
    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->changed:Z

    .line 754
    const/4 v0, 0x3

    if-ne p1, v0, :cond_1

    .line 755
    const-string/jumbo v0, "point"

    invoke-virtual {p3, v0}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/attachments/GeoAttachment;

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->attachLocation(Lcom/vkontakte/android/attachments/GeoAttachment;)V

    goto :goto_0

    .line 759
    :cond_1
    iget-object v0, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->attachView:Lcom/vkontakte/android/ui/AttachmentsEditorView;

    invoke-static {p0, p1, p3}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter$$Lambda$4;->lambdaFactory$(Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;ILandroid/content/Intent;)Ljava/lang/Runnable;

    move-result-object v1

    const-wide/16 v2, 0x12c

    invoke-virtual {v0, v1, v2, v3}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->postDelayed(Ljava/lang/Runnable;J)Z

    goto :goto_0
.end method

.method public onAllUploadsDone()V
    .locals 0

    .prologue
    .line 420
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->updateSendButton()V

    .line 421
    return-void
.end method

.method public onAttachmentRemoved(Lcom/vkontakte/android/attachments/Attachment;)V
    .locals 1
    .param p1, "att"    # Lcom/vkontakte/android/attachments/Attachment;

    .prologue
    .line 411
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->updateSendButton()V

    .line 412
    iget-object v0, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->attachView:Lcom/vkontakte/android/ui/AttachmentsEditorView;

    invoke-virtual {v0}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->getCount()I

    move-result v0

    if-nez v0, :cond_0

    .line 413
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->showAttachView(Z)V

    .line 415
    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->changed:Z

    .line 416
    return-void
.end method

.method onBackPressed()Z
    .locals 3

    .prologue
    .line 857
    iget-object v0, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mEdit:Lcom/vkontakte/android/NewsEntry;

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->changed:Z

    if-nez v0, :cond_1

    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mEdit:Lcom/vkontakte/android/NewsEntry;

    if-nez v0, :cond_4

    iget-object v0, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mStatusEdit:Landroid/widget/EditText;

    invoke-virtual {v0}, Landroid/widget/EditText;->length()I

    move-result v0

    if-gtz v0, :cond_1

    iget-object v0, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->attachView:Lcom/vkontakte/android/ui/AttachmentsEditorView;

    invoke-virtual {v0}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->getCount()I

    move-result v0

    if-gtz v0, :cond_1

    iget-object v0, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->geoAttach:Lcom/vkontakte/android/attachments/GeoAttachment;

    if-eqz v0, :cond_4

    .line 858
    :cond_1
    new-instance v0, Lcom/vkontakte/android/VKAlertDialog$Builder;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    invoke-virtual {v1}, Lcom/vkontakte/android/fragments/news/NewPostFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/vkontakte/android/VKAlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v1, 0x7f080176

    .line 859
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/VKAlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    iget-object v0, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mEdit:Lcom/vkontakte/android/NewsEntry;

    if-eqz v0, :cond_2

    const v0, 0x7f08017a

    .line 860
    :goto_0
    invoke-virtual {v1, v0}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    iget-object v0, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mEdit:Lcom/vkontakte/android/NewsEntry;

    if-eqz v0, :cond_3

    const v0, 0x7f080597

    :goto_1
    invoke-static {p0}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter$$Lambda$5;->lambdaFactory$(Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;)Landroid/content/DialogInterface$OnClickListener;

    move-result-object v2

    .line 861
    invoke-virtual {v1, v0, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f08011f

    const/4 v2, 0x0

    .line 864
    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 865
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 866
    const/4 v0, 0x1

    .line 868
    :goto_2
    return v0

    .line 859
    :cond_2
    const v0, 0x7f080179

    goto :goto_0

    .line 860
    :cond_3
    const v0, 0x7f08019c

    goto :goto_1

    .line 868
    :cond_4
    const/4 v0, 0x0

    goto :goto_2
.end method

.method public onClick(Landroid/view/View;)V
    .locals 5
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 469
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 513
    :cond_0
    :goto_0
    return-void

    .line 471
    :pswitch_0
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->checkAttachLimit()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 474
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->startPhotoChooser()V

    goto :goto_0

    .line 478
    :pswitch_1
    iget-object v0, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->geoAttach:Lcom/vkontakte/android/attachments/GeoAttachment;

    if-nez v0, :cond_1

    .line 479
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->startLocationChooser()V

    goto :goto_0

    .line 481
    :cond_1
    new-instance v0, Lcom/vkontakte/android/VKAlertDialog$Builder;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    invoke-virtual {v1}, Lcom/vkontakte/android/fragments/news/NewPostFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/vkontakte/android/VKAlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v1, 0x7f0804f5

    .line 482
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/VKAlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const/4 v1, 0x2

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    iget-object v3, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    const v4, 0x7f0801c7

    .line 483
    invoke-virtual {v3, v4}, Lcom/vkontakte/android/fragments/news/NewPostFragment;->getString(I)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x1

    iget-object v3, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    const v4, 0x7f08019c

    invoke-virtual {v3, v4}, Lcom/vkontakte/android/fragments/news/NewPostFragment;->getString(I)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {p0}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter$$Lambda$1;->lambdaFactory$(Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;)Landroid/content/DialogInterface$OnClickListener;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setItems([Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 495
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    goto :goto_0

    .line 500
    :pswitch_2
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->showOptions()V

    goto :goto_0

    .line 504
    :pswitch_3
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->startMentionChooser()V

    goto :goto_0

    .line 509
    :pswitch_4
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->showExtendedAttachMenu()V

    goto :goto_0

    .line 469
    nop

    :pswitch_data_0
    .packed-switch 0x7f100572
        :pswitch_1
        :pswitch_3
        :pswitch_0
        :pswitch_4
        :pswitch_2
    .end packed-switch
.end method

.method public onTextChanged(Ljava/lang/CharSequence;III)V
    .locals 11
    .param p1, "s"    # Ljava/lang/CharSequence;
    .param p2, "start"    # I
    .param p3, "before"    # I
    .param p4, "count"    # I

    .prologue
    const/4 v7, 0x1

    .line 430
    if-le p4, v7, :cond_4

    iget-object v6, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    iget-object v6, v6, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mClipboardManager:Landroid/content/ClipboardManager;

    invoke-virtual {v6}, Landroid/content/ClipboardManager;->hasPrimaryClip()Z

    move-result v6

    if-eqz v6, :cond_4

    .line 431
    const/4 v3, 0x0

    .line 432
    .local v3, "hasLinkAttachment":Z
    iget-object v6, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    iget-object v6, v6, Lcom/vkontakte/android/fragments/news/NewPostFragment;->attachView:Lcom/vkontakte/android/ui/AttachmentsEditorView;

    invoke-virtual {v6}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->getAll()Ljava/util/ArrayList;

    move-result-object v6

    invoke-virtual {v6}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :cond_0
    :goto_0
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_1

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/attachments/Attachment;

    .line 433
    .local v0, "attachment":Lcom/vkontakte/android/attachments/Attachment;
    instance-of v8, v0, Lcom/vkontakte/android/attachments/LinkAttachment;

    if-eqz v8, :cond_0

    .line 434
    const/4 v3, 0x1

    goto :goto_0

    .line 437
    .end local v0    # "attachment":Lcom/vkontakte/android/attachments/Attachment;
    :cond_1
    if-nez v3, :cond_4

    .line 439
    iget-object v6, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    iget-object v6, v6, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mClipboardManager:Landroid/content/ClipboardManager;

    invoke-virtual {v6}, Landroid/content/ClipboardManager;->getPrimaryClip()Landroid/content/ClipData;

    move-result-object v2

    .line 440
    .local v2, "data":Landroid/content/ClipData;
    if-eqz v2, :cond_4

    invoke-virtual {v2}, Landroid/content/ClipData;->getItemCount()I

    move-result v6

    if-lez v6, :cond_4

    .line 441
    invoke-virtual {v2}, Landroid/content/ClipData;->getItemCount()I

    move-result v6

    add-int/lit8 v6, v6, -0x1

    invoke-virtual {v2, v6}, Landroid/content/ClipData;->getItemAt(I)Landroid/content/ClipData$Item;

    move-result-object v4

    .line 442
    .local v4, "item":Landroid/content/ClipData$Item;
    if-eqz v4, :cond_2

    invoke-virtual {v4}, Landroid/content/ClipData$Item;->getText()Ljava/lang/CharSequence;

    move-result-object v6

    if-nez v6, :cond_3

    .line 460
    .end local v2    # "data":Landroid/content/ClipData;
    .end local v3    # "hasLinkAttachment":Z
    .end local v4    # "item":Landroid/content/ClipData$Item;
    :cond_2
    :goto_1
    return-void

    .line 445
    .restart local v2    # "data":Landroid/content/ClipData;
    .restart local v3    # "hasLinkAttachment":Z
    .restart local v4    # "item":Landroid/content/ClipData$Item;
    :cond_3
    invoke-virtual {v4}, Landroid/content/ClipData$Item;->getText()Ljava/lang/CharSequence;

    move-result-object v6

    invoke-interface {v6}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v1

    .line 446
    .local v1, "clipLink":Ljava/lang/String;
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-nez v6, :cond_4

    .line 447
    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lcom/vkontakte/android/LinkParser;->tryExtractLink(Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v5

    .line 448
    .local v5, "link":Ljava/lang/String;
    if-eqz v5, :cond_4

    invoke-virtual {v5, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_4

    .line 449
    const-string/jumbo v6, "vk"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v9, "LINK "

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {v6, v8}, Lcom/vkontakte/android/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 450
    iget-object v6, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    iget-object v6, v6, Lcom/vkontakte/android/fragments/news/NewPostFragment;->attachView:Lcom/vkontakte/android/ui/AttachmentsEditorView;

    new-instance v8, Lcom/vkontakte/android/attachments/LinkAttachment;

    const-string/jumbo v9, ""

    const-string/jumbo v10, ""

    invoke-direct {v8, v5, v9, v10}, Lcom/vkontakte/android/attachments/LinkAttachment;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v6, v8}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->add(Lcom/vkontakte/android/attachments/Attachment;)V

    .line 451
    invoke-virtual {p0, v7}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->showAttachView(Z)V

    .line 457
    .end local v1    # "clipLink":Ljava/lang/String;
    .end local v2    # "data":Landroid/content/ClipData;
    .end local v3    # "hasLinkAttachment":Z
    .end local v4    # "item":Landroid/content/ClipData$Item;
    .end local v5    # "link":Ljava/lang/String;
    :cond_4
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->updateSendButton()V

    .line 458
    iget-object v6, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    iget-object v6, v6, Lcom/vkontakte/android/fragments/news/NewPostFragment;->attachView:Lcom/vkontakte/android/ui/AttachmentsEditorView;

    invoke-virtual {v6}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->getVisibility()I

    move-result v6

    if-nez v6, :cond_5

    move v6, v7

    :goto_2
    invoke-virtual {p0, v6}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->showAttachView(Z)V

    .line 459
    iput-boolean v7, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->changed:Z

    goto :goto_1

    .line 458
    :cond_5
    const/4 v6, 0x0

    goto :goto_2
.end method

.method public onUploadFailed()V
    .locals 0

    .prologue
    .line 406
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->updateSendButton()V

    .line 407
    return-void
.end method

.method post()V
    .locals 13

    .prologue
    const/4 v12, 0x1

    .line 1317
    iget-object v7, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    iget-object v7, v7, Lcom/vkontakte/android/fragments/news/NewPostFragment;->attachView:Lcom/vkontakte/android/ui/AttachmentsEditorView;

    invoke-virtual {v7}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->isUploading()Z

    move-result v7

    if-eqz v7, :cond_1

    .line 1500
    :cond_0
    :goto_0
    return-void

    .line 1320
    :cond_1
    iget-object v7, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    iget-object v7, v7, Lcom/vkontakte/android/fragments/news/NewPostFragment;->attachView:Lcom/vkontakte/android/ui/AttachmentsEditorView;

    invoke-virtual {v7}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->getAll()Ljava/util/ArrayList;

    move-result-object v1

    .line 1321
    .local v1, "atts":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/attachments/Attachment;>;"
    const/4 v4, 0x0

    .local v4, "i":I
    :goto_1
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v7

    if-ge v4, v7, :cond_2

    .line 1322
    invoke-interface {v1, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/attachments/Attachment;

    .line 1323
    .local v0, "a":Lcom/vkontakte/android/attachments/Attachment;
    instance-of v7, v0, Lcom/vkontakte/android/attachments/PendingPhotoAttachment;

    if-nez v7, :cond_0

    .line 1321
    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 1327
    .end local v0    # "a":Lcom/vkontakte/android/attachments/Attachment;
    :cond_2
    const/4 v3, 0x0

    .line 1328
    .local v3, "exportParam":Ljava/lang/String;
    iget-boolean v7, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->exportToFacebook:Z

    if-eqz v7, :cond_9

    iget-boolean v7, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->exportToTwitter:Z

    if-eqz v7, :cond_9

    .line 1329
    const-string/jumbo v3, "twitter,facebook"

    .line 1335
    :cond_3
    :goto_2
    iget-object v7, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    iget-object v7, v7, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mStatusEdit:Landroid/widget/EditText;

    invoke-virtual {v7}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    .line 1336
    .local v5, "ptext":Ljava/lang/String;
    new-instance v6, Lcom/vkontakte/android/api/VKAPIRequest;

    iget-object v7, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    iget-object v7, v7, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mEdit:Lcom/vkontakte/android/NewsEntry;

    if-eqz v7, :cond_c

    iget-boolean v7, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->isSuggest:Z

    if-nez v7, :cond_c

    iget-boolean v7, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->isComment:Z

    if-eqz v7, :cond_b

    const-string/jumbo v7, ""

    :goto_3
    invoke-direct {v6, v7}, Lcom/vkontakte/android/api/VKAPIRequest;-><init>(Ljava/lang/String;)V

    .line 1337
    .local v6, "req":Lcom/vkontakte/android/api/VKAPIRequest;, "Lcom/vkontakte/android/api/VKAPIRequest<Lorg/json/JSONObject;>;"
    const-string/jumbo v7, "device"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v9, Landroid/os/Build;->BRAND:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string/jumbo v9, ":"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    sget-object v9, Landroid/os/Build;->MANUFACTURER:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string/jumbo v9, ":"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    sget-object v9, Landroid/os/Build;->MODEL:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string/jumbo v9, ":"

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    sget-object v9, Landroid/os/Build;->PRODUCT:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v7, v8}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 1338
    const-string/jumbo v7, "owner_id"

    iget-object v8, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    iget v8, v8, Lcom/vkontakte/android/fragments/news/NewPostFragment;->uid:I

    invoke-virtual {v6, v7, v8}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 1339
    iget-object v7, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->postponeTo:Ljava/util/Calendar;

    if-eqz v7, :cond_4

    .line 1340
    const-string/jumbo v7, "publish_date"

    iget-object v8, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->postponeTo:Ljava/util/Calendar;

    invoke-virtual {v8}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v8

    const-wide/16 v10, 0x3e8

    div-long/2addr v8, v10

    long-to-int v8, v8

    invoke-virtual {v6, v7, v8}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 1342
    :cond_4
    iget-object v7, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    iget-object v2, v7, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mEdit:Lcom/vkontakte/android/NewsEntry;

    .line 1343
    .local v2, "edit":Lcom/vkontakte/android/NewsEntry;
    iget-object v7, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    iget-object v7, v7, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mEdit:Lcom/vkontakte/android/NewsEntry;

    if-eqz v7, :cond_5

    .line 1344
    iget-boolean v7, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->isComment:Z

    if-eqz v7, :cond_d

    const-string/jumbo v7, "comment_id"

    :goto_4
    iget v8, v2, Lcom/vkontakte/android/NewsEntry;->postID:I

    invoke-virtual {v6, v7, v8}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 1345
    iget-boolean v7, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->isComment:Z

    if-eqz v7, :cond_5

    .line 1346
    const-string/jumbo v7, "method"

    const-string/jumbo v8, "execute.editComment"

    invoke-virtual {v6, v7, v8}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 1347
    const-string/jumbo v7, "type"

    iget-object v8, v2, Lcom/vkontakte/android/NewsEntry;->retweetText:Ljava/lang/String;

    invoke-virtual {v6, v7, v8}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 1348
    const-string/jumbo v7, "parent_object_id"

    iget v8, v2, Lcom/vkontakte/android/NewsEntry;->retweetOrigId:I

    invoke-virtual {v6, v7, v8}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 1351
    :cond_5
    iget-boolean v7, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->fromGroup:Z

    if-eqz v7, :cond_6

    .line 1352
    const-string/jumbo v7, "from_group"

    invoke-virtual {v6, v7, v12}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 1355
    :cond_6
    iget-boolean v7, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->signedFromGroup:Z

    if-eqz v7, :cond_e

    .line 1356
    const-string/jumbo v7, "signed"

    invoke-virtual {v6, v7, v12}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 1361
    :cond_7
    :goto_5
    iget-object v7, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->geoAttach:Lcom/vkontakte/android/attachments/GeoAttachment;

    if-eqz v7, :cond_8

    .line 1362
    iget-object v7, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->geoAttach:Lcom/vkontakte/android/attachments/GeoAttachment;

    iget v7, v7, Lcom/vkontakte/android/attachments/GeoAttachment;->id:I

    if-gtz v7, :cond_f

    .line 1363
    const-string/jumbo v7, "lat"

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v9, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->geoAttach:Lcom/vkontakte/android/attachments/GeoAttachment;

    iget-wide v10, v9, Lcom/vkontakte/android/attachments/GeoAttachment;->lat:D

    invoke-virtual {v8, v10, v11}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string/jumbo v9, ""

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v7, v8}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v7

    const-string/jumbo v8, "long"

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v10, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->geoAttach:Lcom/vkontakte/android/attachments/GeoAttachment;

    iget-wide v10, v10, Lcom/vkontakte/android/attachments/GeoAttachment;->lon:D

    invoke-virtual {v9, v10, v11}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string/jumbo v10, ""

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v7, v8, v9}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 1369
    :cond_8
    :goto_6
    invoke-static {v1}, Lcom/vkontakte/android/attachments/Attachment;->sort(Ljava/util/List;)V

    .line 1370
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v7

    if-lez v7, :cond_10

    .line 1371
    const-string/jumbo v7, "attachments"

    const-string/jumbo v8, ","

    invoke-static {v8, v1}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v6, v7, v8}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 1376
    :goto_7
    const-string/jumbo v7, "message"

    invoke-virtual {v6, v7, v5}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 1377
    const-string/jumbo v8, "friends_only"

    iget-boolean v7, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->friendsOnly:Z

    if-eqz v7, :cond_11

    const-string/jumbo v7, "1"

    :goto_8
    invoke-virtual {v6, v8, v7}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 1378
    const-string/jumbo v7, "services"

    invoke-virtual {v6, v7, v3}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v7

    new-instance v8, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter$3;

    invoke-direct {v8, p0, v2}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter$3;-><init>(Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;Lcom/vkontakte/android/NewsEntry;)V

    .line 1379
    invoke-virtual {v7, v8}, Lcom/vkontakte/android/api/VKAPIRequest;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v7

    iget-object v8, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    .line 1498
    invoke-virtual {v8}, Lcom/vkontakte/android/fragments/news/NewPostFragment;->getActivity()Landroid/app/Activity;

    move-result-object v8

    invoke-virtual {v7, v8}, Lcom/vkontakte/android/api/VKAPIRequest;->wrapProgress(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v7

    iget-object v8, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    .line 1499
    invoke-virtual {v8}, Lcom/vkontakte/android/fragments/news/NewPostFragment;->getActivity()Landroid/app/Activity;

    move-result-object v8

    invoke-virtual {v7, v8}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    goto/16 :goto_0

    .line 1330
    .end local v2    # "edit":Lcom/vkontakte/android/NewsEntry;
    .end local v5    # "ptext":Ljava/lang/String;
    .end local v6    # "req":Lcom/vkontakte/android/api/VKAPIRequest;, "Lcom/vkontakte/android/api/VKAPIRequest<Lorg/json/JSONObject;>;"
    :cond_9
    iget-boolean v7, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->exportToTwitter:Z

    if-eqz v7, :cond_a

    .line 1331
    const-string/jumbo v3, "twitter"

    goto/16 :goto_2

    .line 1332
    :cond_a
    iget-boolean v7, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->exportToFacebook:Z

    if-eqz v7, :cond_3

    .line 1333
    const-string/jumbo v3, "facebook"

    goto/16 :goto_2

    .line 1336
    .restart local v5    # "ptext":Ljava/lang/String;
    :cond_b
    const-string/jumbo v7, "execute.wallEdit"

    goto/16 :goto_3

    :cond_c
    const-string/jumbo v7, "execute.wallPost"

    goto/16 :goto_3

    .line 1344
    .restart local v2    # "edit":Lcom/vkontakte/android/NewsEntry;
    .restart local v6    # "req":Lcom/vkontakte/android/api/VKAPIRequest;, "Lcom/vkontakte/android/api/VKAPIRequest<Lorg/json/JSONObject;>;"
    :cond_d
    const-string/jumbo v7, "post_id"

    goto/16 :goto_4

    .line 1357
    :cond_e
    iget-boolean v7, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->fromGroup:Z

    if-eqz v7, :cond_7

    .line 1358
    const-string/jumbo v7, "signed"

    const-string/jumbo v8, "0"

    invoke-virtual {v6, v7, v8}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    goto/16 :goto_5

    .line 1365
    :cond_f
    const-string/jumbo v7, "place_id"

    iget-object v8, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->geoAttach:Lcom/vkontakte/android/attachments/GeoAttachment;

    iget v8, v8, Lcom/vkontakte/android/attachments/GeoAttachment;->id:I

    invoke-virtual {v6, v7, v8}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    goto/16 :goto_6

    .line 1373
    :cond_10
    const-string/jumbo v7, "attachments"

    const-string/jumbo v8, " "

    invoke-virtual {v6, v7, v8}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    goto :goto_7

    .line 1377
    :cond_11
    const/4 v7, 0x0

    goto :goto_8
.end method

.method removeLocation()V
    .locals 2

    .prologue
    .line 1227
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->geoAttach:Lcom/vkontakte/android/attachments/GeoAttachment;

    .line 1228
    iget-object v0, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mLocation:Landroid/widget/ImageView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setSelected(Z)V

    .line 1229
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->updateBottomLine()V

    .line 1230
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->updateSendButton()V

    .line 1231
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->changed:Z

    .line 1232
    return-void
.end method

.method saveComment(I)V
    .locals 8
    .param p1, "type"    # I

    .prologue
    const/16 v7, 0x11

    .line 1257
    iget-object v5, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    iget-object v5, v5, Lcom/vkontakte/android/fragments/news/NewPostFragment;->attachView:Lcom/vkontakte/android/ui/AttachmentsEditorView;

    invoke-virtual {v5}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->isUploading()Z

    move-result v5

    if-eqz v5, :cond_1

    .line 1314
    :cond_0
    :goto_0
    return-void

    .line 1260
    :cond_1
    iget-object v5, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    iget-object v5, v5, Lcom/vkontakte/android/fragments/news/NewPostFragment;->attachView:Lcom/vkontakte/android/ui/AttachmentsEditorView;

    invoke-virtual {v5}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->getAll()Ljava/util/ArrayList;

    move-result-object v1

    .line 1261
    .local v1, "atts":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/attachments/Attachment;>;"
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_1
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v5

    if-ge v3, v5, :cond_2

    .line 1262
    invoke-interface {v1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/attachments/Attachment;

    .line 1263
    .local v0, "a":Lcom/vkontakte/android/attachments/Attachment;
    instance-of v5, v0, Lcom/vkontakte/android/attachments/PendingPhotoAttachment;

    if-nez v5, :cond_0

    .line 1261
    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 1269
    .end local v0    # "a":Lcom/vkontakte/android/attachments/Attachment;
    :cond_2
    if-ne p1, v7, :cond_3

    .line 1270
    new-instance v4, Lcom/vkontakte/android/api/VKAPIRequest;

    const-string/jumbo v5, "market.editComment"

    invoke-direct {v4, v5}, Lcom/vkontakte/android/api/VKAPIRequest;-><init>(Ljava/lang/String;)V

    .line 1274
    .local v4, "req":Lcom/vkontakte/android/api/VKAPIRequest;, "Lcom/vkontakte/android/api/VKAPIRequest<Lorg/json/JSONObject;>;"
    :goto_2
    invoke-static {v1}, Lcom/vkontakte/android/attachments/Attachment;->sort(Ljava/util/List;)V

    .line 1275
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v5

    if-lez v5, :cond_4

    .line 1276
    const-string/jumbo v5, "attachments"

    const-string/jumbo v6, ","

    invoke-static {v6, v1}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 1281
    :goto_3
    iget-object v5, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    iget-object v5, v5, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mEdit:Lcom/vkontakte/android/NewsEntry;

    iget-object v5, v5, Lcom/vkontakte/android/NewsEntry;->extra:Landroid/os/Bundle;

    const-class v6, Lcom/vkontakte/android/api/board/BoardComment;

    invoke-virtual {v6}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v6

    invoke-virtual {v5, v6}, Landroid/os/Bundle;->setClassLoader(Ljava/lang/ClassLoader;)V

    .line 1282
    iget-object v5, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    iget-object v5, v5, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mEdit:Lcom/vkontakte/android/NewsEntry;

    iget-object v5, v5, Lcom/vkontakte/android/NewsEntry;->extra:Landroid/os/Bundle;

    const-string/jumbo v6, "comment"

    invoke-virtual {v5, v6}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v2

    check-cast v2, Lcom/vkontakte/android/api/board/BoardComment;

    .line 1283
    .local v2, "comment":Lcom/vkontakte/android/api/board/BoardComment;
    iget-object v5, v2, Lcom/vkontakte/android/api/board/BoardComment;->attachments:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->clear()V

    .line 1284
    iget-object v5, v2, Lcom/vkontakte/android/api/board/BoardComment;->attachments:Ljava/util/ArrayList;

    invoke-virtual {v5, v1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 1285
    iget-object v5, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    iget-object v5, v5, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mStatusEdit:Landroid/widget/EditText;

    invoke-virtual {v5}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    iput-object v5, v2, Lcom/vkontakte/android/api/board/BoardComment;->text:Ljava/lang/String;

    .line 1287
    if-ne p1, v7, :cond_5

    .line 1288
    const-string/jumbo v5, "message"

    iget-object v6, v2, Lcom/vkontakte/android/api/board/BoardComment;->text:Ljava/lang/String;

    invoke-virtual {v4, v5, v6}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 1289
    const-string/jumbo v5, "comment_id"

    iget v6, v2, Lcom/vkontakte/android/api/board/BoardComment;->id:I

    invoke-virtual {v4, v5, v6}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 1290
    const-string/jumbo v5, "owner_id"

    iget-object v6, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    iget-object v6, v6, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mEdit:Lcom/vkontakte/android/NewsEntry;

    iget-object v6, v6, Lcom/vkontakte/android/NewsEntry;->extra:Landroid/os/Bundle;

    const-string/jumbo v7, "group_id"

    invoke-virtual {v6, v7}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v6

    invoke-virtual {v4, v5, v6}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 1298
    :goto_4
    new-instance v5, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter$2;

    invoke-direct {v5, p0, v2}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter$2;-><init>(Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;Lcom/vkontakte/android/api/board/BoardComment;)V

    invoke-virtual {v4, v5}, Lcom/vkontakte/android/api/VKAPIRequest;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v5

    iget-object v6, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    .line 1313
    invoke-virtual {v6}, Lcom/vkontakte/android/fragments/news/NewPostFragment;->getActivity()Landroid/app/Activity;

    move-result-object v6

    invoke-virtual {v5, v6}, Lcom/vkontakte/android/api/VKAPIRequest;->wrapProgress(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v5

    iget-object v6, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    invoke-virtual {v6}, Lcom/vkontakte/android/fragments/news/NewPostFragment;->getActivity()Landroid/app/Activity;

    move-result-object v6

    invoke-virtual {v5, v6}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    goto/16 :goto_0

    .line 1272
    .end local v2    # "comment":Lcom/vkontakte/android/api/board/BoardComment;
    .end local v4    # "req":Lcom/vkontakte/android/api/VKAPIRequest;, "Lcom/vkontakte/android/api/VKAPIRequest<Lorg/json/JSONObject;>;"
    :cond_3
    new-instance v4, Lcom/vkontakte/android/api/VKAPIRequest;

    const-string/jumbo v5, "board.editComment"

    invoke-direct {v4, v5}, Lcom/vkontakte/android/api/VKAPIRequest;-><init>(Ljava/lang/String;)V

    .restart local v4    # "req":Lcom/vkontakte/android/api/VKAPIRequest;, "Lcom/vkontakte/android/api/VKAPIRequest<Lorg/json/JSONObject;>;"
    goto/16 :goto_2

    .line 1278
    :cond_4
    const-string/jumbo v5, "attachments"

    const-string/jumbo v6, " "

    invoke-virtual {v4, v5, v6}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    goto/16 :goto_3

    .line 1292
    .restart local v2    # "comment":Lcom/vkontakte/android/api/board/BoardComment;
    :cond_5
    const-string/jumbo v5, "text"

    iget-object v6, v2, Lcom/vkontakte/android/api/board/BoardComment;->text:Ljava/lang/String;

    invoke-virtual {v4, v5, v6}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 1293
    const-string/jumbo v5, "comment_id"

    iget v6, v2, Lcom/vkontakte/android/api/board/BoardComment;->id:I

    invoke-virtual {v4, v5, v6}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 1294
    const-string/jumbo v5, "topic_id"

    iget-object v6, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    iget-object v6, v6, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mEdit:Lcom/vkontakte/android/NewsEntry;

    iget-object v6, v6, Lcom/vkontakte/android/NewsEntry;->extra:Landroid/os/Bundle;

    const-string/jumbo v7, "topic_id"

    invoke-virtual {v6, v7}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v6

    invoke-virtual {v4, v5, v6}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 1295
    const-string/jumbo v5, "group_id"

    iget-object v6, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    iget-object v6, v6, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mEdit:Lcom/vkontakte/android/NewsEntry;

    iget-object v6, v6, Lcom/vkontakte/android/NewsEntry;->extra:Landroid/os/Bundle;

    const-string/jumbo v7, "group_id"

    invoke-virtual {v6, v7}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v6

    invoke-virtual {v4, v5, v6}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    goto :goto_4
.end method

.method send()V
    .locals 2

    .prologue
    .line 516
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->publishing:Z

    .line 517
    iget-object v0, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mEdit:Lcom/vkontakte/android/NewsEntry;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mEdit:Lcom/vkontakte/android/NewsEntry;

    iget v0, v0, Lcom/vkontakte/android/NewsEntry;->type:I

    const/16 v1, 0xe

    if-eq v0, v1, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mEdit:Lcom/vkontakte/android/NewsEntry;

    iget v0, v0, Lcom/vkontakte/android/NewsEntry;->type:I

    const/16 v1, 0x11

    if-ne v0, v1, :cond_1

    .line 518
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mEdit:Lcom/vkontakte/android/NewsEntry;

    iget v0, v0, Lcom/vkontakte/android/NewsEntry;->type:I

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->saveComment(I)V

    .line 522
    :goto_0
    return-void

    .line 520
    :cond_1
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->post()V

    goto :goto_0
.end method

.method sendEnabled(Z)V
    .locals 2
    .param p1, "enabled"    # Z

    .prologue
    .line 525
    iget-object v0, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    iget-boolean v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mSendEnabled:Z

    if-eq p1, v0, :cond_1

    .line 526
    iget-object v0, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    iput-boolean p1, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mSendEnabled:Z

    .line 527
    iget-object v0, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/news/NewPostFragment;->invalidateOptionsMenu()V

    .line 528
    iget-object v0, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mSendItem:Landroid/view/MenuItem;

    if-eqz v0, :cond_0

    .line 529
    iget-object v0, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mSendItem:Landroid/view/MenuItem;

    invoke-interface {v0, p1}, Landroid/view/MenuItem;->setEnabled(Z)Landroid/view/MenuItem;

    .line 531
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mSendIcon:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_1

    .line 532
    iget-object v0, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    iget-object v1, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mSendIcon:Landroid/graphics/drawable/Drawable;

    if-eqz p1, :cond_2

    const/16 v0, 0xff

    :goto_0
    invoke-virtual {v1, v0}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 535
    :cond_1
    return-void

    .line 532
    :cond_2
    const/16 v0, 0x7f

    goto :goto_0
.end method

.method sendText(I)V
    .locals 2
    .param p1, "text"    # I
        .annotation build Landroid/support/annotation/StringRes;
        .end annotation
    .end param

    .prologue
    .line 538
    iget-object v0, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    iput p1, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mSendText:I

    .line 539
    iget-object v0, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/news/NewPostFragment;->invalidateOptionsMenu()V

    .line 540
    iget-object v0, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mSendItem:Landroid/view/MenuItem;

    if-eqz v0, :cond_0

    .line 541
    iget-object v0, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mSendItem:Landroid/view/MenuItem;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    iget v1, v1, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mSendText:I

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setTitle(I)Landroid/view/MenuItem;

    .line 543
    :cond_0
    return-void
.end method

.method setupInitialData()V
    .locals 24

    .prologue
    .line 558
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget-boolean v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mSendAction:Z

    move/from16 v19, v0

    if-eqz v19, :cond_7

    .line 560
    :try_start_0
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->text:Ljava/lang/String;

    move-object/from16 v16, v0

    .line 561
    .local v16, "txt":Ljava/lang/String;
    const/4 v11, 0x0

    .line 562
    .local v11, "link":Ljava/lang/String;
    if-eqz v16, :cond_1

    .line 563
    sget-object v19, Lcom/vkontakte/android/LinkParser;->URL_PATTERN:Ljava/util/regex/Pattern;

    move-object/from16 v0, v19

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v12

    .line 564
    .local v12, "m":Ljava/util/regex/Matcher;
    invoke-virtual {v12}, Ljava/util/regex/Matcher;->find()Z

    move-result v19

    if-eqz v19, :cond_0

    .line 565
    invoke-virtual {v12}, Ljava/util/regex/Matcher;->group()Ljava/lang/String;

    move-result-object v11

    .line 566
    const-string/jumbo v19, ""

    move-object/from16 v0, v19

    invoke-virtual {v12, v0}, Ljava/util/regex/Matcher;->replaceFirst(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v16

    .line 567
    invoke-virtual/range {v16 .. v16}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v16

    .line 572
    .end local v12    # "m":Ljava/util/regex/Matcher;
    :cond_0
    :goto_0
    const-string/jumbo v19, "vk"

    new-instance v20, Ljava/lang/StringBuilder;

    invoke-direct/range {v20 .. v20}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v21, "LINK "

    invoke-virtual/range {v20 .. v21}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    move-object/from16 v0, v20

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v20

    invoke-static/range {v19 .. v20}, Lcom/vkontakte/android/Log;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 573
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mAttachments:[Landroid/os/Parcelable;

    move-object/from16 v19, v0

    if-eqz v19, :cond_3

    .line 574
    const/4 v10, 0x0

    .local v10, "i":I
    :goto_1
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mAttachments:[Landroid/os/Parcelable;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    array-length v0, v0

    move/from16 v19, v0

    move/from16 v0, v19

    if-ge v10, v0, :cond_2

    .line 575
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mAttachments:[Landroid/os/Parcelable;

    move-object/from16 v19, v0

    aget-object v6, v19, v10

    .line 576
    .local v6, "att":Landroid/os/Parcelable;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->attachView:Lcom/vkontakte/android/ui/AttachmentsEditorView;

    move-object/from16 v19, v0

    check-cast v6, Lcom/vkontakte/android/attachments/Attachment;

    .end local v6    # "att":Landroid/os/Parcelable;
    move-object/from16 v0, v19

    invoke-virtual {v0, v6}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->add(Lcom/vkontakte/android/attachments/Attachment;)V

    .line 574
    add-int/lit8 v10, v10, 0x1

    goto :goto_1

    .line 570
    .end local v10    # "i":I
    :cond_1
    const-string/jumbo v16, ""

    goto :goto_0

    .line 578
    .restart local v10    # "i":I
    :cond_2
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mAttachments:[Landroid/os/Parcelable;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    array-length v0, v0

    move/from16 v19, v0

    if-lez v19, :cond_3

    .line 579
    const/16 v19, 0x1

    move-object/from16 v0, p0

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->showAttachView(Z)V

    .line 582
    .end local v10    # "i":I
    :cond_3
    const/4 v9, 0x0

    .line 583
    .local v9, "hasLinkAttachment":Z
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->attachView:Lcom/vkontakte/android/ui/AttachmentsEditorView;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->getAll()Ljava/util/ArrayList;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v19

    :cond_4
    :goto_2
    invoke-interface/range {v19 .. v19}, Ljava/util/Iterator;->hasNext()Z

    move-result v20

    if-eqz v20, :cond_5

    invoke-interface/range {v19 .. v19}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/vkontakte/android/attachments/Attachment;

    .line 584
    .local v7, "attachment":Lcom/vkontakte/android/attachments/Attachment;
    instance-of v0, v7, Lcom/vkontakte/android/attachments/LinkAttachment;

    move/from16 v20, v0

    if-eqz v20, :cond_4

    .line 585
    const/4 v9, 0x1

    goto :goto_2

    .line 588
    .end local v7    # "attachment":Lcom/vkontakte/android/attachments/Attachment;
    :cond_5
    if-nez v9, :cond_6

    if-eqz v11, :cond_6

    .line 589
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->attachView:Lcom/vkontakte/android/ui/AttachmentsEditorView;

    move-object/from16 v19, v0

    new-instance v20, Lcom/vkontakte/android/attachments/LinkAttachment;

    const-string/jumbo v21, ""

    const-string/jumbo v22, ""

    move-object/from16 v0, v20

    move-object/from16 v1, v21

    move-object/from16 v2, v22

    invoke-direct {v0, v11, v1, v2}, Lcom/vkontakte/android/attachments/LinkAttachment;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual/range {v19 .. v20}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->add(Lcom/vkontakte/android/attachments/Attachment;)V

    .line 590
    const/16 v19, 0x1

    move-object/from16 v0, p0

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->showAttachView(Z)V

    .line 592
    :cond_6
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mStatusEdit:Landroid/widget/EditText;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    move-object/from16 v1, v16

    invoke-virtual {v0, v1}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 593
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mStatusEdit:Landroid/widget/EditText;

    move-object/from16 v19, v0

    invoke-virtual/range {v16 .. v16}, Ljava/lang/String;->length()I

    move-result v20

    invoke-virtual/range {v19 .. v20}, Landroid/widget/EditText;->setSelection(I)V

    .line 594
    const/16 v19, 0x1

    move-object/from16 v0, p0

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->sendEnabled(Z)V

    .line 596
    invoke-direct/range {p0 .. p0}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->forbidAttachmentEditIfRequired()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 604
    .end local v9    # "hasLinkAttachment":Z
    .end local v11    # "link":Ljava/lang/String;
    .end local v16    # "txt":Ljava/lang/String;
    :cond_7
    :goto_3
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->photoURI:Landroid/net/Uri;

    move-object/from16 v19, v0

    if-eqz v19, :cond_8

    .line 605
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->attachView:Lcom/vkontakte/android/ui/AttachmentsEditorView;

    move-object/from16 v19, v0

    new-instance v20, Lcom/vkontakte/android/attachments/PendingPhotoAttachment;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    move-object/from16 v21, v0

    move-object/from16 v0, v21

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->photoURI:Landroid/net/Uri;

    move-object/from16 v21, v0

    invoke-virtual/range {v21 .. v21}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v21

    invoke-direct/range {v20 .. v21}, Lcom/vkontakte/android/attachments/PendingPhotoAttachment;-><init>(Ljava/lang/String;)V

    invoke-virtual/range {v19 .. v20}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->add(Lcom/vkontakte/android/attachments/Attachment;)V

    .line 606
    const/16 v19, 0x1

    move-object/from16 v0, p0

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->sendEnabled(Z)V

    .line 607
    const/16 v19, 0x1

    move-object/from16 v0, p0

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->showAttachView(Z)V

    .line 610
    :cond_8
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mPhotos:Ljava/util/ArrayList;

    move-object/from16 v19, v0

    if-eqz v19, :cond_a

    .line 611
    const/4 v10, 0x0

    .restart local v10    # "i":I
    :goto_4
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mPhotos:Ljava/util/ArrayList;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Ljava/util/ArrayList;->size()I

    move-result v19

    move/from16 v0, v19

    if-ge v10, v0, :cond_9

    .line 612
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mPhotos:Ljava/util/ArrayList;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    invoke-virtual {v0, v10}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/lang/String;

    .line 613
    .local v13, "photo":Ljava/lang/String;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->attachView:Lcom/vkontakte/android/ui/AttachmentsEditorView;

    move-object/from16 v19, v0

    new-instance v20, Lcom/vkontakte/android/attachments/PendingPhotoAttachment;

    move-object/from16 v0, v20

    invoke-direct {v0, v13}, Lcom/vkontakte/android/attachments/PendingPhotoAttachment;-><init>(Ljava/lang/String;)V

    invoke-virtual/range {v19 .. v20}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->add(Lcom/vkontakte/android/attachments/Attachment;)V

    .line 611
    add-int/lit8 v10, v10, 0x1

    goto :goto_4

    .line 599
    .end local v10    # "i":I
    .end local v13    # "photo":Ljava/lang/String;
    :catch_0
    move-exception v18

    .line 600
    .local v18, "x":Ljava/lang/Exception;
    const-string/jumbo v19, "vk"

    const-string/jumbo v20, "WTF you just did?!"

    invoke-static/range {v19 .. v20}, Lcom/vkontakte/android/Log;->w(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_3

    .line 615
    .end local v18    # "x":Ljava/lang/Exception;
    .restart local v10    # "i":I
    :cond_9
    const/16 v19, 0x1

    move-object/from16 v0, p0

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->sendEnabled(Z)V

    .line 616
    const/16 v19, 0x1

    move-object/from16 v0, p0

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->showAttachView(Z)V

    .line 619
    .end local v10    # "i":I
    :cond_a
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v5

    .line 620
    .local v5, "account":Lcom/vkontakte/android/auth/VKAccount;
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->uid:I

    move/from16 v19, v0

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v20

    move/from16 v0, v19

    move/from16 v1, v20

    if-ne v0, v1, :cond_10

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mEdit:Lcom/vkontakte/android/NewsEntry;

    move-object/from16 v19, v0

    if-nez v19, :cond_10

    .line 621
    invoke-virtual {v5}, Lcom/vkontakte/android/auth/VKAccount;->isExportTwitterAvail()Z

    move-result v19

    if-eqz v19, :cond_b

    .line 622
    const/16 v19, 0x1

    move/from16 v0, v19

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->exportToTwitter:Z

    .line 624
    :cond_b
    invoke-virtual {v5}, Lcom/vkontakte/android/auth/VKAccount;->isExportFacebookAvail()Z

    move-result v19

    if-eqz v19, :cond_c

    .line 625
    const/16 v19, 0x1

    move/from16 v0, v19

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->exportToFacebook:Z

    .line 627
    :cond_c
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->updateExportIcons()V

    .line 633
    :goto_5
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget-boolean v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mPublic:Z

    move/from16 v19, v0

    if-eqz v19, :cond_d

    .line 634
    const/16 v19, 0x1

    move/from16 v0, v19

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->fromGroup:Z

    .line 636
    :cond_d
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mEdit:Lcom/vkontakte/android/NewsEntry;

    move-object/from16 v19, v0

    if-eqz v19, :cond_17

    .line 637
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mEdit:Lcom/vkontakte/android/NewsEntry;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget-object v15, v0, Lcom/vkontakte/android/NewsEntry;->text:Ljava/lang/String;

    .line 638
    .local v15, "text":Ljava/lang/String;
    const-string/jumbo v19, "<a href=\'vkontakte://profile/([0-9]+)\'>([^<]+)</a>"

    const-string/jumbo v20, "*id$1 ($2)"

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    invoke-virtual {v15, v0, v1}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    .line 639
    const-string/jumbo v19, "<a href=\'vkontakte://profile/-([0-9]+)\'>([^<]+)</a>"

    const-string/jumbo v20, "*club$1 ($2)"

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    invoke-virtual {v15, v0, v1}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    .line 640
    const-string/jumbo v19, "<a href=\'vklink://view/[^\']+\'>([^<]+)</a>"

    const-string/jumbo v20, "$1"

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    invoke-virtual {v15, v0, v1}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    .line 641
    const-string/jumbo v19, "<a href=\'vkontakte://search/[^\']+\'>([^<]+)</a>"

    const-string/jumbo v20, "$1"

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    invoke-virtual {v15, v0, v1}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    .line 642
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mStatusEdit:Landroid/widget/EditText;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    invoke-virtual {v0, v15}, Landroid/widget/EditText;->setText(Ljava/lang/CharSequence;)V

    .line 643
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mStatusEdit:Landroid/widget/EditText;

    move-object/from16 v19, v0

    invoke-virtual {v15}, Ljava/lang/String;->length()I

    move-result v20

    invoke-virtual/range {v19 .. v20}, Landroid/widget/EditText;->setSelection(I)V

    .line 644
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    move-object/from16 v19, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mEdit:Lcom/vkontakte/android/NewsEntry;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    iget v0, v0, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    move/from16 v20, v0

    move/from16 v0, v20

    move-object/from16 v1, v19

    iput v0, v1, Lcom/vkontakte/android/fragments/news/NewPostFragment;->uid:I

    .line 645
    const/4 v14, 0x0

    .line 646
    .local v14, "showAttachView":Z
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mEdit:Lcom/vkontakte/android/NewsEntry;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget-object v0, v0, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v19

    :cond_e
    invoke-interface/range {v19 .. v19}, Ljava/util/Iterator;->hasNext()Z

    move-result v20

    if-eqz v20, :cond_f

    invoke-interface/range {v19 .. v19}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/vkontakte/android/attachments/Attachment;

    .line 647
    .local v6, "att":Lcom/vkontakte/android/attachments/Attachment;
    instance-of v0, v6, Lcom/vkontakte/android/attachments/SignatureLinkAttachment;

    move/from16 v20, v0

    if-eqz v20, :cond_e

    .line 648
    const/16 v19, 0x1

    move/from16 v0, v19

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->signedFromGroup:Z

    .line 649
    move-object/from16 v0, p0

    iput-object v6, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->sigAttach:Lcom/vkontakte/android/attachments/Attachment;

    .line 650
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mEdit:Lcom/vkontakte/android/NewsEntry;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget-object v0, v0, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 651
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mSignatureText:Landroid/widget/TextView;

    move-object/from16 v20, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->sigAttach:Lcom/vkontakte/android/attachments/Attachment;

    move-object/from16 v19, v0

    check-cast v19, Lcom/vkontakte/android/attachments/LinkAttachment;

    move-object/from16 v0, v19

    iget-object v0, v0, Lcom/vkontakte/android/attachments/LinkAttachment;->title:Ljava/lang/String;

    move-object/from16 v19, v0

    move-object/from16 v0, v20

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 652
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mSignatureText:Landroid/widget/TextView;

    move-object/from16 v19, v0

    const/16 v20, 0x0

    invoke-virtual/range {v19 .. v20}, Landroid/widget/TextView;->setVisibility(I)V

    .line 656
    .end local v6    # "att":Lcom/vkontakte/android/attachments/Attachment;
    :cond_f
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mEdit:Lcom/vkontakte/android/NewsEntry;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget-object v8, v0, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    .line 657
    .local v8, "attachments":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/attachments/Attachment;>;"
    const/4 v10, 0x0

    .restart local v10    # "i":I
    :goto_6
    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    move-result v19

    move/from16 v0, v19

    if-ge v10, v0, :cond_12

    .line 658
    invoke-virtual {v8, v10}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/vkontakte/android/attachments/Attachment;

    .line 659
    .restart local v6    # "att":Lcom/vkontakte/android/attachments/Attachment;
    instance-of v0, v6, Lcom/vkontakte/android/attachments/GeoAttachment;

    move/from16 v19, v0

    if-nez v19, :cond_11

    .line 660
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->attachView:Lcom/vkontakte/android/ui/AttachmentsEditorView;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    invoke-virtual {v0, v6}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->add(Lcom/vkontakte/android/attachments/Attachment;)V

    .line 661
    const/4 v14, 0x1

    .line 657
    .end local v6    # "att":Lcom/vkontakte/android/attachments/Attachment;
    :goto_7
    add-int/lit8 v10, v10, 0x1

    goto :goto_6

    .line 629
    .end local v8    # "attachments":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/attachments/Attachment;>;"
    .end local v10    # "i":I
    .end local v14    # "showAttachView":Z
    .end local v15    # "text":Ljava/lang/String;
    :cond_10
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mFbIcon:Landroid/view/View;

    move-object/from16 v19, v0

    const/16 v20, 0x8

    invoke-virtual/range {v19 .. v20}, Landroid/view/View;->setVisibility(I)V

    .line 630
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mTwitterIcon:Landroid/view/View;

    move-object/from16 v19, v0

    const/16 v20, 0x8

    invoke-virtual/range {v19 .. v20}, Landroid/view/View;->setVisibility(I)V

    .line 631
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mFriendsOnlyIcon:Landroid/view/View;

    move-object/from16 v19, v0

    const/16 v20, 0x8

    invoke-virtual/range {v19 .. v20}, Landroid/view/View;->setVisibility(I)V

    goto/16 :goto_5

    .line 663
    .restart local v6    # "att":Lcom/vkontakte/android/attachments/Attachment;
    .restart local v8    # "attachments":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/attachments/Attachment;>;"
    .restart local v10    # "i":I
    .restart local v14    # "showAttachView":Z
    .restart local v15    # "text":Ljava/lang/String;
    :cond_11
    check-cast v6, Lcom/vkontakte/android/attachments/GeoAttachment;

    .end local v6    # "att":Lcom/vkontakte/android/attachments/Attachment;
    move-object/from16 v0, p0

    invoke-virtual {v0, v6}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->attachLocation(Lcom/vkontakte/android/attachments/GeoAttachment;)V

    goto :goto_7

    .line 666
    :cond_12
    move-object/from16 v0, p0

    invoke-virtual {v0, v14}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->showAttachView(Z)V

    .line 667
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mEdit:Lcom/vkontakte/android/NewsEntry;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget v0, v0, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    move/from16 v19, v0

    if-gez v19, :cond_13

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mEdit:Lcom/vkontakte/android/NewsEntry;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget v0, v0, Lcom/vkontakte/android/NewsEntry;->userID:I

    move/from16 v19, v0

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v20

    move/from16 v0, v19

    move/from16 v1, v20

    if-eq v0, v1, :cond_13

    .line 668
    const/16 v19, 0x1

    move/from16 v0, v19

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->fromGroup:Z

    .line 670
    :cond_13
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mEdit:Lcom/vkontakte/android/NewsEntry;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget v0, v0, Lcom/vkontakte/android/NewsEntry;->type:I

    move/from16 v19, v0

    const/16 v20, 0x5

    move/from16 v0, v19

    move/from16 v1, v20

    if-ne v0, v1, :cond_14

    .line 671
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mSettings:Landroid/view/View;

    move-object/from16 v19, v0

    const/16 v20, 0x8

    invoke-virtual/range {v19 .. v20}, Landroid/view/View;->setVisibility(I)V

    .line 672
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mLocation:Landroid/widget/ImageView;

    move-object/from16 v19, v0

    const/16 v20, 0x8

    invoke-virtual/range {v19 .. v20}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 673
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    move-object/from16 v19, v0

    const v20, 0x7f0801c7

    invoke-static/range {v19 .. v20}, Lcom/vkontakte/android/fragments/news/NewPostFragment;->access$100(Lcom/vkontakte/android/fragments/news/NewPostFragment;I)V

    .line 674
    const/16 v19, 0x1

    move/from16 v0, v19

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->isComment:Z

    .line 676
    :cond_14
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mEdit:Lcom/vkontakte/android/NewsEntry;

    move-object/from16 v19, v0

    const/16 v20, 0x1000

    invoke-virtual/range {v19 .. v20}, Lcom/vkontakte/android/NewsEntry;->flag(I)Z

    move-result v19

    if-eqz v19, :cond_1f

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mEdit:Lcom/vkontakte/android/NewsEntry;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget v0, v0, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    move/from16 v19, v0

    move/from16 v0, v19

    neg-int v0, v0

    move/from16 v19, v0

    invoke-static/range {v19 .. v19}, Lcom/vkontakte/android/data/Groups;->getAdminLevel(I)I

    move-result v19

    const/16 v20, 0x2

    move/from16 v0, v19

    move/from16 v1, v20

    if-lt v0, v1, :cond_1f

    const/16 v19, 0x1

    :goto_8
    move/from16 v0, v19

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->isSuggest:Z

    .line 677
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mEdit:Lcom/vkontakte/android/NewsEntry;

    move-object/from16 v19, v0

    const/16 v20, 0x800

    invoke-virtual/range {v19 .. v20}, Lcom/vkontakte/android/NewsEntry;->flag(I)Z

    move-result v19

    if-eqz v19, :cond_15

    .line 678
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v19

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->postponeTo:Ljava/util/Calendar;

    .line 679
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->postponeTo:Ljava/util/Calendar;

    move-object/from16 v19, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mEdit:Lcom/vkontakte/android/NewsEntry;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    iget v0, v0, Lcom/vkontakte/android/NewsEntry;->time:I

    move/from16 v20, v0

    move/from16 v0, v20

    int-to-long v0, v0

    move-wide/from16 v20, v0

    const-wide/16 v22, 0x3e8

    mul-long v20, v20, v22

    invoke-virtual/range {v19 .. v21}, Ljava/util/Calendar;->setTimeInMillis(J)V

    .line 680
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->updateTimer()V

    .line 681
    const v19, 0x7f080706

    move-object/from16 v0, p0

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->sendText(I)V

    .line 682
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mEdit:Lcom/vkontakte/android/NewsEntry;

    move-object/from16 v19, v0

    const/16 v20, 0x200

    invoke-virtual/range {v19 .. v20}, Lcom/vkontakte/android/NewsEntry;->flag(I)Z

    move-result v19

    move/from16 v0, v19

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->friendsOnly:Z

    .line 683
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mEdit:Lcom/vkontakte/android/NewsEntry;

    move-object/from16 v19, v0

    const/16 v20, 0x2000

    invoke-virtual/range {v19 .. v20}, Lcom/vkontakte/android/NewsEntry;->flag(I)Z

    move-result v19

    move/from16 v0, v19

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->exportToTwitter:Z

    .line 684
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mEdit:Lcom/vkontakte/android/NewsEntry;

    move-object/from16 v19, v0

    const/16 v20, 0x4000

    invoke-virtual/range {v19 .. v20}, Lcom/vkontakte/android/NewsEntry;->flag(I)Z

    move-result v19

    move/from16 v0, v19

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->exportToFacebook:Z

    .line 685
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->updateExportIcons()V

    .line 687
    :cond_15
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->isSuggest:Z

    move/from16 v19, v0

    if-eqz v19, :cond_16

    .line 688
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mSignatureText:Landroid/widget/TextView;

    move-object/from16 v19, v0

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mEdit:Lcom/vkontakte/android/NewsEntry;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    iget-object v0, v0, Lcom/vkontakte/android/NewsEntry;->userName:Ljava/lang/String;

    move-object/from16 v20, v0

    invoke-virtual/range {v19 .. v20}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 689
    const/16 v19, 0x1

    move/from16 v0, v19

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->signedFromGroup:Z

    .line 690
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mSignatureText:Landroid/widget/TextView;

    move-object/from16 v19, v0

    const/16 v20, 0x0

    invoke-virtual/range {v19 .. v20}, Landroid/widget/TextView;->setVisibility(I)V

    .line 691
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->updateFieldSize()V

    .line 694
    :cond_16
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mEdit:Lcom/vkontakte/android/NewsEntry;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget v0, v0, Lcom/vkontakte/android/NewsEntry;->createdBy:I

    move/from16 v19, v0

    if-lez v19, :cond_17

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->sigAttach:Lcom/vkontakte/android/attachments/Attachment;

    move-object/from16 v19, v0

    if-nez v19, :cond_17

    .line 696
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mSignatureText:Landroid/widget/TextView;

    move-object/from16 v19, v0

    const-string/jumbo v20, "..."

    invoke-virtual/range {v19 .. v20}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 697
    new-instance v17, Ljava/util/ArrayList;

    invoke-direct/range {v17 .. v17}, Ljava/util/ArrayList;-><init>()V

    .line 698
    .local v17, "uids":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mEdit:Lcom/vkontakte/android/NewsEntry;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget v0, v0, Lcom/vkontakte/android/NewsEntry;->createdBy:I

    move/from16 v19, v0

    invoke-static/range {v19 .. v19}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v19

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 699
    invoke-static/range {p0 .. p0}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter$$Lambda$2;->lambdaFactory$(Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;)Lcom/vkontakte/android/data/Friends$GetUsersCallback;

    move-result-object v19

    move-object/from16 v0, v17

    move-object/from16 v1, v19

    invoke-static {v0, v1}, Lcom/vkontakte/android/data/Friends;->getUsers(Ljava/util/Collection;Lcom/vkontakte/android/data/Friends$GetUsersCallback;)V

    .line 713
    .end local v8    # "attachments":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/attachments/Attachment;>;"
    .end local v10    # "i":I
    .end local v14    # "showAttachView":Z
    .end local v15    # "text":Ljava/lang/String;
    .end local v17    # "uids":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    :cond_17
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->uid:I

    move/from16 v19, v0

    if-gez v19, :cond_18

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->uid:I

    move/from16 v19, v0

    move/from16 v0, v19

    neg-int v0, v0

    move/from16 v19, v0

    invoke-static/range {v19 .. v19}, Lcom/vkontakte/android/data/Groups;->getAdminLevel(I)I

    move-result v19

    const/16 v20, 0x2

    move/from16 v0, v19

    move/from16 v1, v20

    if-lt v0, v1, :cond_1a

    :cond_18
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mEdit:Lcom/vkontakte/android/NewsEntry;

    move-object/from16 v19, v0

    if-eqz v19, :cond_19

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->isSuggest:Z

    move/from16 v19, v0

    if-nez v19, :cond_19

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mEdit:Lcom/vkontakte/android/NewsEntry;

    move-object/from16 v19, v0

    const/16 v20, 0x800

    .line 714
    invoke-virtual/range {v19 .. v20}, Lcom/vkontakte/android/NewsEntry;->flag(I)Z

    move-result v19

    if-eqz v19, :cond_1a

    :cond_19
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->uid:I

    move/from16 v19, v0

    if-lez v19, :cond_1b

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->uid:I

    move/from16 v19, v0

    .line 715
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v20

    invoke-virtual/range {v20 .. v20}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v20

    move/from16 v0, v19

    move/from16 v1, v20

    if-eq v0, v1, :cond_1b

    .line 716
    :cond_1a
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mSettings:Landroid/view/View;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Landroid/view/View;->getVisibility()I

    move-result v19

    if-nez v19, :cond_1b

    .line 717
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mSettings:Landroid/view/View;

    move-object/from16 v19, v0

    const/16 v20, 0x0

    invoke-virtual/range {v19 .. v20}, Landroid/view/View;->setEnabled(Z)V

    .line 718
    new-instance v4, Landroid/view/animation/AlphaAnimation;

    const v19, 0x3ecccccd    # 0.4f

    const v20, 0x3ecccccd    # 0.4f

    move/from16 v0, v19

    move/from16 v1, v20

    invoke-direct {v4, v0, v1}, Landroid/view/animation/AlphaAnimation;-><init>(FF)V

    .line 719
    .local v4, "aa":Landroid/view/animation/AlphaAnimation;
    const/16 v19, 0x1

    move/from16 v0, v19

    invoke-virtual {v4, v0}, Landroid/view/animation/AlphaAnimation;->setFillAfter(Z)V

    .line 720
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mSettings:Landroid/view/View;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    invoke-virtual {v0, v4}, Landroid/view/View;->startAnimation(Landroid/view/animation/Animation;)V

    .line 723
    .end local v4    # "aa":Landroid/view/animation/AlphaAnimation;
    :cond_1b
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->updateSendButton()V

    .line 724
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->attachView:Lcom/vkontakte/android/ui/AttachmentsEditorView;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->getCount()I

    move-result v19

    if-nez v19, :cond_1c

    .line 725
    const/16 v19, 0x0

    move-object/from16 v0, p0

    move/from16 v1, v19

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->showAttachView(Z)V

    .line 728
    :cond_1c
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->attachView:Lcom/vkontakte/android/ui/AttachmentsEditorView;

    move-object/from16 v19, v0

    invoke-static/range {p0 .. p0}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter$$Lambda$3;->lambdaFactory$(Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;)Ljava/lang/Runnable;

    move-result-object v20

    const-wide/16 v22, 0x64

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    move-wide/from16 v2, v22

    invoke-virtual {v0, v1, v2, v3}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 730
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->isSuggest:Z

    move/from16 v19, v0

    if-nez v19, :cond_1d

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->sigAttach:Lcom/vkontakte/android/attachments/Attachment;

    move-object/from16 v19, v0

    if-nez v19, :cond_1d

    .line 731
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mSignatureText:Landroid/widget/TextView;

    move-object/from16 v19, v0

    invoke-virtual {v5}, Lcom/vkontakte/android/auth/VKAccount;->getName()Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 734
    :cond_1d
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    move-object/from16 v19, v0

    move-object/from16 v0, v19

    iget-boolean v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mCamera:Z

    move/from16 v19, v0

    if-eqz v19, :cond_1e

    .line 735
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->startCamera()V

    .line 737
    :cond_1e
    return-void

    .line 676
    .restart local v8    # "attachments":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/attachments/Attachment;>;"
    .restart local v10    # "i":I
    .restart local v14    # "showAttachView":Z
    .restart local v15    # "text":Ljava/lang/String;
    :cond_1f
    const/16 v19, 0x0

    goto/16 :goto_8
.end method

.method showAttachView(Z)V
    .locals 2
    .param p1, "show"    # Z

    .prologue
    .line 873
    iget-object v0, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    iget-object v1, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->attachView:Lcom/vkontakte/android/ui/AttachmentsEditorView;

    if-eqz p1, :cond_0

    const/4 v0, 0x0

    :goto_0
    invoke-virtual {v1, v0}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->setVisibility(I)V

    .line 874
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->updateFieldSize()V

    .line 875
    return-void

    .line 873
    :cond_0
    const/16 v0, 0x8

    goto :goto_0
.end method

.method showExtendedAttachMenu()V
    .locals 8

    .prologue
    .line 896
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 897
    .local v4, "opts":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    iget-object v5, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    const v6, 0x7f0800e1

    invoke-virtual {v5, v6}, Lcom/vkontakte/android/fragments/news/NewPostFragment;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 898
    iget-object v5, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    const v6, 0x7f08074b

    invoke-virtual {v5, v6}, Lcom/vkontakte/android/fragments/news/NewPostFragment;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 899
    iget-object v5, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    const v6, 0x7f0801b8

    invoke-virtual {v5, v6}, Lcom/vkontakte/android/fragments/news/NewPostFragment;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 900
    iget-object v5, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    iget v5, v5, Lcom/vkontakte/android/fragments/news/NewPostFragment;->uid:I

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v6

    invoke-virtual {v6}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v6

    if-eq v5, v6, :cond_0

    iget-object v5, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    iget v5, v5, Lcom/vkontakte/android/fragments/news/NewPostFragment;->uid:I

    if-gez v5, :cond_3

    .line 901
    :cond_0
    const/4 v3, 0x0

    .line 902
    .local v3, "hasPoll":Z
    iget-object v5, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    iget-object v5, v5, Lcom/vkontakte/android/fragments/news/NewPostFragment;->attachView:Lcom/vkontakte/android/ui/AttachmentsEditorView;

    invoke-virtual {v5}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->getAll()Ljava/util/ArrayList;

    move-result-object v1

    .line 903
    .local v1, "atts":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/attachments/Attachment;>;"
    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_1
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_2

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/attachments/Attachment;

    .line 904
    .local v0, "att":Lcom/vkontakte/android/attachments/Attachment;
    instance-of v6, v0, Lcom/vkontakte/android/attachments/PollAttachment;

    if-eqz v6, :cond_1

    .line 905
    const/4 v3, 0x1

    .line 909
    .end local v0    # "att":Lcom/vkontakte/android/attachments/Attachment;
    :cond_2
    if-nez v3, :cond_3

    .line 910
    iget-object v5, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    const v6, 0x7f0800db

    invoke-virtual {v5, v6}, Lcom/vkontakte/android/fragments/news/NewPostFragment;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 913
    .end local v1    # "atts":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/attachments/Attachment;>;"
    .end local v3    # "hasPoll":Z
    :cond_3
    new-instance v6, Lcom/vkontakte/android/VKAlertDialog$Builder;

    iget-object v5, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    invoke-virtual {v5}, Lcom/vkontakte/android/fragments/news/NewPostFragment;->getActivity()Landroid/app/Activity;

    move-result-object v5

    invoke-direct {v6, v5}, Lcom/vkontakte/android/VKAlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 914
    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v5

    new-array v5, v5, [Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v5

    check-cast v5, [Ljava/lang/CharSequence;

    invoke-static {p0}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter$$Lambda$6;->lambdaFactory$(Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;)Landroid/content/DialogInterface$OnClickListener;

    move-result-object v7

    invoke-virtual {v6, v5, v7}, Lcom/vkontakte/android/VKAlertDialog$Builder;->setItems([Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v5

    const v6, 0x7f0800d6

    .line 942
    invoke-virtual {v5, v6}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v5

    .line 943
    invoke-virtual {v5}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    move-result-object v2

    .line 944
    .local v2, "dlg":Landroid/app/AlertDialog;
    const/4 v5, 0x1

    invoke-virtual {v2, v5}, Landroid/app/AlertDialog;->setCanceledOnTouchOutside(Z)V

    .line 945
    return-void
.end method

.method showOptions()V
    .locals 14

    .prologue
    const/4 v13, 0x4

    const/4 v11, 0x3

    const/4 v12, 0x2

    const/4 v8, 0x1

    const/4 v9, 0x0

    .line 1046
    iget-object v10, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    iget v10, v10, Lcom/vkontakte/android/fragments/news/NewPostFragment;->uid:I

    if-lez v10, :cond_9

    .line 1047
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 1048
    .local v4, "items":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 1049
    .local v1, "acts":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    new-array v6, v13, [Z

    iget-boolean v10, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->friendsOnly:Z

    aput-boolean v10, v6, v9

    aput-boolean v9, v6, v8

    aput-boolean v9, v6, v12

    aput-boolean v9, v6, v11

    .line 1050
    .local v6, "opts":[Z
    new-array v3, v13, [Z

    fill-array-data v3, :array_0

    .line 1051
    .local v3, "enabled":[Z
    const/4 v5, 0x1

    .line 1052
    .local v5, "o":I
    iget-object v10, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    invoke-virtual {v10}, Lcom/vkontakte/android/fragments/news/NewPostFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v10

    const v11, 0x7f08042a

    invoke-virtual {v10, v11}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v4, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1053
    const-string/jumbo v10, "friendsonly"

    invoke-virtual {v1, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1054
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v10

    invoke-virtual {v10}, Lcom/vkontakte/android/auth/VKAccount;->isExportTwitterAvail()Z

    move-result v10

    if-eqz v10, :cond_1

    .line 1055
    iget-object v10, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    invoke-virtual {v10}, Lcom/vkontakte/android/fragments/news/NewPostFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v10

    const v11, 0x7f080429

    invoke-virtual {v10, v11}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v4, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1056
    const-string/jumbo v10, "twitter"

    invoke-virtual {v1, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1057
    iget-boolean v10, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->exportToTwitter:Z

    aput-boolean v10, v6, v5

    .line 1058
    iget-boolean v10, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->friendsOnly:Z

    if-eqz v10, :cond_0

    .line 1059
    aput-boolean v9, v3, v5

    .line 1061
    :cond_0
    add-int/lit8 v5, v5, 0x1

    .line 1063
    :cond_1
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v10

    invoke-virtual {v10}, Lcom/vkontakte/android/auth/VKAccount;->isExportFacebookAvail()Z

    move-result v10

    if-eqz v10, :cond_3

    .line 1064
    iget-object v10, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    invoke-virtual {v10}, Lcom/vkontakte/android/fragments/news/NewPostFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v10

    const v11, 0x7f080428

    invoke-virtual {v10, v11}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v4, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1065
    const-string/jumbo v10, "fb"

    invoke-virtual {v1, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1066
    iget-boolean v10, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->exportToFacebook:Z

    aput-boolean v10, v6, v5

    .line 1067
    iget-boolean v10, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->friendsOnly:Z

    if-eqz v10, :cond_2

    .line 1068
    aput-boolean v9, v3, v5

    .line 1070
    :cond_2
    add-int/lit8 v5, v5, 0x1

    .line 1073
    :cond_3
    iget-object v10, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    iget-object v10, v10, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mEdit:Lcom/vkontakte/android/NewsEntry;

    if-eqz v10, :cond_4

    iget-object v10, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    iget-object v10, v10, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mEdit:Lcom/vkontakte/android/NewsEntry;

    const/16 v11, 0x800

    invoke-virtual {v10, v11}, Lcom/vkontakte/android/NewsEntry;->flag(I)Z

    move-result v10

    if-eqz v10, :cond_6

    :cond_4
    iget-object v10, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    iget v10, v10, Lcom/vkontakte/android/fragments/news/NewPostFragment;->uid:I

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v11

    invoke-virtual {v11}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v11

    if-eq v10, v11, :cond_5

    iget-object v10, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    iget v10, v10, Lcom/vkontakte/android/fragments/news/NewPostFragment;->uid:I

    if-eqz v10, :cond_5

    iget-object v10, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    iget v10, v10, Lcom/vkontakte/android/fragments/news/NewPostFragment;->uid:I

    if-gez v10, :cond_6

    iget-boolean v10, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->fromGroup:Z

    if-eqz v10, :cond_6

    .line 1074
    :cond_5
    iget-object v10, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    const v11, 0x7f080704

    invoke-virtual {v10, v11}, Lcom/vkontakte/android/fragments/news/NewPostFragment;->getString(I)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v4, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1075
    const-string/jumbo v10, "timer"

    invoke-virtual {v1, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1076
    iget-object v10, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->postponeTo:Ljava/util/Calendar;

    if-eqz v10, :cond_8

    :goto_0
    aput-boolean v8, v6, v5

    .line 1078
    add-int/lit8 v5, v5, 0x1

    .line 1081
    :cond_6
    new-instance v9, Lcom/vkontakte/android/VKAlertDialog$Builder;

    iget-object v8, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    invoke-virtual {v8}, Lcom/vkontakte/android/fragments/news/NewPostFragment;->getActivity()Landroid/app/Activity;

    move-result-object v8

    invoke-direct {v9, v8}, Lcom/vkontakte/android/VKAlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 1082
    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v8

    new-array v8, v8, [Ljava/lang/String;

    invoke-virtual {v4, v8}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v8

    check-cast v8, [Ljava/lang/CharSequence;

    invoke-static {p0, v1, v3, v6}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter$$Lambda$10;->lambdaFactory$(Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;Ljava/util/ArrayList;[Z[Z)Landroid/content/DialogInterface$OnMultiChoiceClickListener;

    move-result-object v10

    invoke-virtual {v9, v8, v6, v10}, Lcom/vkontakte/android/VKAlertDialog$Builder;->setMultiChoiceItems([Ljava/lang/CharSequence;[ZLandroid/content/DialogInterface$OnMultiChoiceClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v8

    const v9, 0x7f080479

    invoke-static {p0, v6}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter$$Lambda$11;->lambdaFactory$(Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;[Z)Landroid/content/DialogInterface$OnClickListener;

    move-result-object v10

    .line 1111
    invoke-virtual {v8, v9, v10}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v8

    const v9, 0x7f080517

    .line 1121
    invoke-virtual {v8, v9}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v8

    .line 1122
    invoke-virtual {v8}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    move-result-object v2

    .line 1123
    .local v2, "dlg":Landroid/app/AlertDialog;
    iget-object v8, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    invoke-virtual {v2}, Landroid/app/AlertDialog;->getListView()Landroid/widget/ListView;

    move-result-object v9

    iput-object v9, v8, Lcom/vkontakte/android/fragments/news/NewPostFragment;->optionsAlertView:Landroid/widget/ListView;

    .line 1124
    iget-object v8, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    iget-object v8, v8, Lcom/vkontakte/android/fragments/news/NewPostFragment;->optionsAlertView:Landroid/widget/ListView;

    invoke-virtual {v8, v6}, Landroid/widget/ListView;->setTag(Ljava/lang/Object;)V

    .line 1125
    invoke-static {p0}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter$$Lambda$12;->lambdaFactory$(Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;)Landroid/content/DialogInterface$OnDismissListener;

    move-result-object v8

    invoke-virtual {v2, v8}, Landroid/app/AlertDialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 1178
    .end local v5    # "o":I
    :goto_1
    invoke-virtual {v2}, Landroid/app/AlertDialog;->getListView()Landroid/widget/ListView;

    move-result-object v8

    invoke-static {v2, v3}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter$$Lambda$15;->lambdaFactory$(Landroid/app/AlertDialog;[Z)Landroid/view/View$OnTouchListener;

    move-result-object v9

    invoke-virtual {v8, v9}, Landroid/widget/ListView;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 1182
    iget-object v8, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    invoke-virtual {v2}, Landroid/app/AlertDialog;->getListView()Landroid/widget/ListView;

    move-result-object v9

    iput-object v9, v8, Lcom/vkontakte/android/fragments/news/NewPostFragment;->optionsAlertView:Landroid/widget/ListView;

    .line 1183
    iget-object v8, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    iget-object v8, v8, Lcom/vkontakte/android/fragments/news/NewPostFragment;->optionsAlertView:Landroid/widget/ListView;

    invoke-virtual {v8, v6}, Landroid/widget/ListView;->setTag(Ljava/lang/Object;)V

    .line 1184
    invoke-static {p0}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter$$Lambda$16;->lambdaFactory$(Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;)Landroid/content/DialogInterface$OnDismissListener;

    move-result-object v8

    invoke-virtual {v2, v8}, Landroid/app/AlertDialog;->setOnDismissListener(Landroid/content/DialogInterface$OnDismissListener;)V

    .line 1187
    invoke-virtual {v2}, Landroid/app/AlertDialog;->getListView()Landroid/widget/ListView;

    move-result-object v8

    invoke-virtual {v8}, Landroid/widget/ListView;->getAdapter()Landroid/widget/ListAdapter;

    move-result-object v7

    check-cast v7, Landroid/widget/ArrayAdapter;

    .line 1188
    .local v7, "wrapped":Landroid/widget/ArrayAdapter;, "Landroid/widget/ArrayAdapter<Ljava/lang/String;>;"
    new-instance v0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter$1;

    invoke-direct {v0, p0, v7, v3}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter$1;-><init>(Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;Landroid/widget/ArrayAdapter;[Z)V

    .line 1216
    .local v0, "a":Landroid/widget/BaseAdapter;
    invoke-virtual {v2}, Landroid/app/AlertDialog;->getListView()Landroid/widget/ListView;

    move-result-object v8

    invoke-virtual {v8, v0}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 1217
    .end local v0    # "a":Landroid/widget/BaseAdapter;
    .end local v1    # "acts":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .end local v2    # "dlg":Landroid/app/AlertDialog;
    .end local v3    # "enabled":[Z
    .end local v4    # "items":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .end local v6    # "opts":[Z
    .end local v7    # "wrapped":Landroid/widget/ArrayAdapter;, "Landroid/widget/ArrayAdapter<Ljava/lang/String;>;"
    :cond_7
    return-void

    .restart local v1    # "acts":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .restart local v3    # "enabled":[Z
    .restart local v4    # "items":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .restart local v5    # "o":I
    .restart local v6    # "opts":[Z
    :cond_8
    move v8, v9

    .line 1076
    goto/16 :goto_0

    .line 1127
    .end local v1    # "acts":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .end local v3    # "enabled":[Z
    .end local v4    # "items":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .end local v5    # "o":I
    .end local v6    # "opts":[Z
    :cond_9
    iget-object v10, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    iget v10, v10, Lcom/vkontakte/android/fragments/news/NewPostFragment;->uid:I

    neg-int v10, v10

    invoke-static {v10}, Lcom/vkontakte/android/data/Groups;->isGroupAdmin(I)Z

    move-result v10

    if-eqz v10, :cond_7

    .line 1130
    new-array v6, v11, [Z

    iget-boolean v10, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->fromGroup:Z

    aput-boolean v10, v6, v9

    iget-boolean v10, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->signedFromGroup:Z

    aput-boolean v10, v6, v8

    iget-object v10, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->postponeTo:Ljava/util/Calendar;

    if-eqz v10, :cond_f

    move v10, v8

    :goto_2
    aput-boolean v10, v6, v12

    .line 1131
    .restart local v6    # "opts":[Z
    new-array v3, v11, [Z

    iget-object v10, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    iget-boolean v10, v10, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mPublic:Z

    if-nez v10, :cond_10

    move v10, v8

    :goto_3
    aput-boolean v10, v3, v9

    iget-object v10, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    iget-boolean v10, v10, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mPublic:Z

    if-nez v10, :cond_a

    iget-boolean v10, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->fromGroup:Z

    if-eqz v10, :cond_11

    :cond_a
    move v10, v8

    :goto_4
    aput-boolean v10, v3, v8

    iget-object v10, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    iget-boolean v10, v10, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mPublic:Z

    if-nez v10, :cond_b

    iget-boolean v10, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->fromGroup:Z

    if-eqz v10, :cond_12

    :cond_b
    move v10, v8

    :goto_5
    aput-boolean v10, v3, v12

    .line 1133
    .restart local v3    # "enabled":[Z
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 1134
    .restart local v4    # "items":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 1135
    .restart local v1    # "acts":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    iget-object v10, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    const v11, 0x7f08050f

    invoke-virtual {v10, v11}, Lcom/vkontakte/android/fragments/news/NewPostFragment;->getString(I)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v4, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1136
    iget-object v10, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    const v11, 0x7f080510

    invoke-virtual {v10, v11}, Lcom/vkontakte/android/fragments/news/NewPostFragment;->getString(I)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v4, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1137
    const-string/jumbo v10, "from_group"

    invoke-virtual {v1, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1138
    const-string/jumbo v10, "signed"

    invoke-virtual {v1, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1140
    iget-object v10, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    iget-object v10, v10, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mEdit:Lcom/vkontakte/android/NewsEntry;

    if-eqz v10, :cond_c

    iget-object v10, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    iget-object v10, v10, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mEdit:Lcom/vkontakte/android/NewsEntry;

    const/16 v11, 0x800

    invoke-virtual {v10, v11}, Lcom/vkontakte/android/NewsEntry;->flag(I)Z

    move-result v10

    if-nez v10, :cond_c

    iget-boolean v10, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->isSuggest:Z

    if-eqz v10, :cond_e

    :cond_c
    iget-object v10, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    iget v10, v10, Lcom/vkontakte/android/fragments/news/NewPostFragment;->uid:I

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v11

    invoke-virtual {v11}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v11

    if-eq v10, v11, :cond_d

    iget-object v10, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    iget v10, v10, Lcom/vkontakte/android/fragments/news/NewPostFragment;->uid:I

    if-gtz v10, :cond_e

    .line 1141
    :cond_d
    iget-object v10, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    const v11, 0x7f080704

    invoke-virtual {v10, v11}, Lcom/vkontakte/android/fragments/news/NewPostFragment;->getString(I)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v4, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1142
    const-string/jumbo v10, "timer"

    invoke-virtual {v1, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1143
    iget-object v10, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->postponeTo:Ljava/util/Calendar;

    if-eqz v10, :cond_13

    :goto_6
    aput-boolean v8, v6, v12

    .line 1146
    :cond_e
    new-instance v9, Lcom/vkontakte/android/VKAlertDialog$Builder;

    iget-object v8, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    invoke-virtual {v8}, Lcom/vkontakte/android/fragments/news/NewPostFragment;->getActivity()Landroid/app/Activity;

    move-result-object v8

    invoke-direct {v9, v8}, Lcom/vkontakte/android/VKAlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 1147
    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v8

    new-array v8, v8, [Ljava/lang/String;

    invoke-virtual {v4, v8}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object v8

    check-cast v8, [Ljava/lang/CharSequence;

    invoke-static {p0, v3, v6}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter$$Lambda$13;->lambdaFactory$(Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;[Z[Z)Landroid/content/DialogInterface$OnMultiChoiceClickListener;

    move-result-object v10

    invoke-virtual {v9, v8, v6, v10}, Lcom/vkontakte/android/VKAlertDialog$Builder;->setMultiChoiceItems([Ljava/lang/CharSequence;[ZLandroid/content/DialogInterface$OnMultiChoiceClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v8

    const v9, 0x7f080479

    invoke-static {p0, v6}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter$$Lambda$14;->lambdaFactory$(Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;[Z)Landroid/content/DialogInterface$OnClickListener;

    move-result-object v10

    .line 1168
    invoke-virtual {v8, v9, v10}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v8

    const v9, 0x7f080517

    .line 1175
    invoke-virtual {v8, v9}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v8

    .line 1176
    invoke-virtual {v8}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    move-result-object v2

    .restart local v2    # "dlg":Landroid/app/AlertDialog;
    goto/16 :goto_1

    .end local v1    # "acts":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .end local v2    # "dlg":Landroid/app/AlertDialog;
    .end local v3    # "enabled":[Z
    .end local v4    # "items":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .end local v6    # "opts":[Z
    :cond_f
    move v10, v9

    .line 1130
    goto/16 :goto_2

    .restart local v6    # "opts":[Z
    :cond_10
    move v10, v9

    .line 1131
    goto/16 :goto_3

    :cond_11
    move v10, v9

    goto/16 :goto_4

    :cond_12
    move v10, v9

    goto/16 :goto_5

    .restart local v1    # "acts":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    .restart local v3    # "enabled":[Z
    .restart local v4    # "items":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    :cond_13
    move v8, v9

    .line 1143
    goto :goto_6

    .line 1050
    nop

    :array_0
    .array-data 1
        0x1t
        0x1t
        0x1t
        0x1t
    .end array-data
.end method

.method showTimerDlg()V
    .locals 6

    .prologue
    .line 948
    new-instance v1, Lcom/vkontakte/android/fragments/DateTimePickerDialogFragment;

    invoke-direct {v1}, Lcom/vkontakte/android/fragments/DateTimePickerDialogFragment;-><init>()V

    .line 949
    .local v1, "p":Lcom/vkontakte/android/fragments/DateTimePickerDialogFragment;
    iget-object v2, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->postponeTo:Ljava/util/Calendar;

    if-eqz v2, :cond_0

    .line 950
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 951
    .local v0, "args":Landroid/os/Bundle;
    const-string/jumbo v2, "date"

    iget-object v3, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->postponeTo:Ljava/util/Calendar;

    invoke-virtual {v3}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v4

    invoke-virtual {v0, v2, v4, v5}, Landroid/os/Bundle;->putLong(Ljava/lang/String;J)V

    .line 952
    invoke-virtual {v1, v0}, Lcom/vkontakte/android/fragments/DateTimePickerDialogFragment;->setArguments(Landroid/os/Bundle;)V

    .line 954
    .end local v0    # "args":Landroid/os/Bundle;
    :cond_0
    invoke-static {p0}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter$$Lambda$7;->lambdaFactory$(Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;)Lcom/vkontakte/android/fragments/DateTimePickerDialogFragment$OnSelectedListener;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/fragments/DateTimePickerDialogFragment;->setOnSelectedListener(Lcom/vkontakte/android/fragments/DateTimePickerDialogFragment$OnSelectedListener;)V

    .line 958
    iget-object v2, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    invoke-virtual {v2}, Lcom/vkontakte/android/fragments/news/NewPostFragment;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v2

    const-string/jumbo v3, "picker"

    invoke-virtual {v1, v2, v3}, Lcom/vkontakte/android/fragments/DateTimePickerDialogFragment;->show(Landroid/app/FragmentManager;Ljava/lang/String;)V

    .line 959
    return-void
.end method

.method startAudioSelector()V
    .locals 3

    .prologue
    .line 972
    new-instance v0, Lcom/vkontakte/android/fragments/AudioListFragment$Builder;

    invoke-direct {v0}, Lcom/vkontakte/android/fragments/AudioListFragment$Builder;-><init>()V

    iget-object v1, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    const/4 v2, 0x4

    invoke-virtual {v0, v1, v2}, Lcom/vkontakte/android/fragments/AudioListFragment$Builder;->forResult(Landroid/app/Fragment;I)Z

    .line 973
    return-void
.end method

.method startCamera()V
    .locals 3

    .prologue
    .line 552
    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    invoke-virtual {v1}, Lcom/vkontakte/android/fragments/news/NewPostFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    const-class v2, Lcom/vkontakte/android/ImagePickerActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 553
    .local v0, "intent":Landroid/content/Intent;
    const-string/jumbo v1, "type"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 554
    iget-object v1, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    const/4 v2, 0x1

    invoke-virtual {v1, v0, v2}, Lcom/vkontakte/android/fragments/news/NewPostFragment;->startActivityForResult(Landroid/content/Intent;I)V

    .line 555
    return-void
.end method

.method startDocumentSelector()V
    .locals 3

    .prologue
    .line 1008
    new-instance v1, Lcom/vkontakte/android/fragments/documents/DocumentsFragmentBuilder;

    const/4 v0, 0x1

    invoke-direct {v1, v0}, Lcom/vkontakte/android/fragments/documents/DocumentsFragmentBuilder;-><init>(Z)V

    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->isComment:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x2

    :goto_0
    iget-object v2, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    iget-object v2, v2, Lcom/vkontakte/android/fragments/news/NewPostFragment;->attachView:Lcom/vkontakte/android/ui/AttachmentsEditorView;

    invoke-virtual {v2}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->getCount()I

    move-result v2

    sub-int/2addr v0, v2

    invoke-virtual {v1, v0}, Lcom/vkontakte/android/fragments/documents/DocumentsFragmentBuilder;->setLimit(I)Lcom/vkontakte/android/fragments/documents/DocumentsFragmentBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    const/4 v2, 0x6

    invoke-virtual {v0, v1, v2}, Lcom/vkontakte/android/fragments/documents/DocumentsFragmentBuilder;->forResult(Landroid/app/Fragment;I)Z

    .line 1009
    return-void

    .line 1008
    :cond_0
    const/16 v0, 0xa

    goto :goto_0
.end method

.method startLocationChooser()V
    .locals 4

    .prologue
    const/4 v3, 0x3

    .line 1019
    iget-object v1, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    invoke-virtual {v1}, Lcom/vkontakte/android/fragments/news/NewPostFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/Activity;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    const-string/jumbo v2, "location_providers_allowed"

    invoke-static {v1, v2}, Landroid/provider/Settings$Secure;->getString(Landroid/content/ContentResolver;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 1020
    .local v0, "locationProviders":Ljava/lang/String;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_1

    .line 1021
    :cond_0
    new-instance v1, Lcom/vkontakte/android/VKAlertDialog$Builder;

    iget-object v2, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    invoke-virtual {v2}, Lcom/vkontakte/android/fragments/news/NewPostFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/vkontakte/android/VKAlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v2, 0x7f08033f

    .line 1022
    invoke-virtual {v1, v2}, Lcom/vkontakte/android/VKAlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const v2, 0x7f08033e

    .line 1023
    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const v2, 0x7f080488

    invoke-static {p0}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter$$Lambda$9;->lambdaFactory$(Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;)Landroid/content/DialogInterface$OnClickListener;

    move-result-object v3

    .line 1024
    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const v2, 0x7f08011f

    const/4 v3, 0x0

    .line 1027
    invoke-virtual {v1, v2, v3}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 1028
    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 1037
    :goto_0
    return-void

    .line 1031
    :cond_1
    iget-object v1, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    iget v1, v1, Lcom/vkontakte/android/fragments/news/NewPostFragment;->uid:I

    invoke-static {v1}, Lcom/vkontakte/android/auth/VKAccountManager;->isCurrentUser(I)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 1033
    invoke-static {}, Lcom/vkontakte/android/fragments/location/CheckInFragment;->start()Lcom/vkontakte/android/navigation/Navigator;

    move-result-object v1

    iget-object v2, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    invoke-virtual {v1, v2, v3}, Lcom/vkontakte/android/navigation/Navigator;->forResult(Landroid/app/Fragment;I)Z

    goto :goto_0

    .line 1035
    :cond_2
    new-instance v1, Lcom/vkontakte/android/fragments/location/SelectGeoPointFragment$Builder;

    invoke-direct {v1}, Lcom/vkontakte/android/fragments/location/SelectGeoPointFragment$Builder;-><init>()V

    iget-object v2, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    invoke-virtual {v1, v2, v3}, Lcom/vkontakte/android/fragments/location/SelectGeoPointFragment$Builder;->forResult(Landroid/app/Fragment;I)Z

    goto :goto_0
.end method

.method startMentionChooser()V
    .locals 3

    .prologue
    .line 1040
    new-instance v0, Lcom/vkontakte/android/fragments/friends/FriendsFragment$Builder;

    invoke-direct {v0}, Lcom/vkontakte/android/fragments/friends/FriendsFragment$Builder;-><init>()V

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/friends/FriendsFragment$Builder;->setSelect()Lcom/vkontakte/android/fragments/friends/FriendsFragment$Builder;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    const/4 v2, 0x7

    invoke-virtual {v0, v1, v2}, Lcom/vkontakte/android/fragments/friends/FriendsFragment$Builder;->forResult(Landroid/app/Fragment;I)Z

    .line 1041
    return-void
.end method

.method startPhotoChooser()V
    .locals 4

    .prologue
    .line 546
    new-instance v0, Landroid/content/Intent;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    invoke-virtual {v1}, Lcom/vkontakte/android/fragments/news/NewPostFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    const-class v2, Lcom/vkontakte/android/ImagePickerActivity;

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 547
    .local v0, "intent":Landroid/content/Intent;
    const-string/jumbo v2, "limit"

    iget-boolean v1, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->isComment:Z

    if-eqz v1, :cond_0

    const/4 v1, 0x2

    :goto_0
    iget-object v3, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    iget-object v3, v3, Lcom/vkontakte/android/fragments/news/NewPostFragment;->attachView:Lcom/vkontakte/android/ui/AttachmentsEditorView;

    invoke-virtual {v3}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->getCount()I

    move-result v3

    sub-int/2addr v1, v3

    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 548
    iget-object v1, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    const/4 v2, 0x1

    invoke-virtual {v1, v0, v2}, Lcom/vkontakte/android/fragments/news/NewPostFragment;->startActivityForResult(Landroid/content/Intent;I)V

    .line 549
    return-void

    .line 547
    :cond_0
    const/16 v1, 0xa

    goto :goto_0
.end method

.method startPollSelector()V
    .locals 3

    .prologue
    .line 1015
    iget-object v0, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    iget v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->uid:I

    invoke-static {v0}, Lcom/vkontakte/android/fragments/news/PollEditorFragment;->create(I)Lcom/vkontakte/android/fragments/news/PollEditorFragment$Builder;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    const/16 v2, 0x8

    invoke-virtual {v0, v1, v2}, Lcom/vkontakte/android/fragments/news/PollEditorFragment$Builder;->forResult(Landroid/app/Fragment;I)Z

    .line 1016
    return-void
.end method

.method startVideoSelector()V
    .locals 5

    .prologue
    .line 976
    new-instance v0, Lcom/vkontakte/android/VKAlertDialog$Builder;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    invoke-virtual {v1}, Lcom/vkontakte/android/fragments/news/NewPostFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/vkontakte/android/VKAlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const/4 v1, 0x3

    new-array v1, v1, [Ljava/lang/String;

    const/4 v2, 0x0

    iget-object v3, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    .line 977
    invoke-virtual {v3}, Lcom/vkontakte/android/fragments/news/NewPostFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f0800be

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x1

    iget-object v3, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    invoke-virtual {v3}, Lcom/vkontakte/android/fragments/news/NewPostFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f0800bd

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    const/4 v2, 0x2

    iget-object v3, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    invoke-virtual {v3}, Lcom/vkontakte/android/fragments/news/NewPostFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f080416

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    aput-object v3, v1, v2

    invoke-static {p0}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter$$Lambda$8;->lambdaFactory$(Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;)Landroid/content/DialogInterface$OnClickListener;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Lcom/vkontakte/android/VKAlertDialog$Builder;->setItems([Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f08074b

    .line 997
    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 998
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 999
    return-void
.end method

.method updateBottomLine()V
    .locals 6

    .prologue
    .line 1235
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 1236
    .local v1, "lines":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    iget-object v2, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->postponeTo:Ljava/util/Calendar;

    if-eqz v2, :cond_0

    .line 1237
    iget-object v2, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->postponeTo:Ljava/util/Calendar;

    invoke-virtual {v2}, Ljava/util/Calendar;->getTimeInMillis()J

    move-result-wide v2

    const-wide/16 v4, 0x3e8

    div-long/2addr v2, v4

    long-to-int v0, v2

    .line 1238
    .local v0, "date":I
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    const v4, 0x7f080705

    invoke-virtual {v3, v4}, Lcom/vkontakte/android/fragments/news/NewPostFragment;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, " "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {v0}, Lcom/vkontakte/android/TimeUtils;->langDate(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1240
    .end local v0    # "date":I
    :cond_0
    iget-object v2, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->geoAttach:Lcom/vkontakte/android/attachments/GeoAttachment;

    if-eqz v2, :cond_1

    .line 1241
    iget-object v2, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->geoAttach:Lcom/vkontakte/android/attachments/GeoAttachment;

    iget-object v2, v2, Lcom/vkontakte/android/attachments/GeoAttachment;->title:Ljava/lang/String;

    if-eqz v2, :cond_2

    iget-object v2, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->geoAttach:Lcom/vkontakte/android/attachments/GeoAttachment;

    iget-object v2, v2, Lcom/vkontakte/android/attachments/GeoAttachment;->title:Ljava/lang/String;

    :goto_0
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1243
    :cond_1
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v2

    if-lez v2, :cond_3

    .line 1244
    iget-object v2, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    iget-object v2, v2, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mLocationAddress:Landroid/widget/TextView;

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setVisibility(I)V

    .line 1245
    iget-object v2, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    iget-object v2, v2, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mLocationAddress:Landroid/widget/TextView;

    const-string/jumbo v3, "\n"

    invoke-static {v3, v1}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1249
    :goto_1
    return-void

    .line 1241
    :cond_2
    iget-object v2, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->geoAttach:Lcom/vkontakte/android/attachments/GeoAttachment;

    iget-object v2, v2, Lcom/vkontakte/android/attachments/GeoAttachment;->address:Ljava/lang/String;

    goto :goto_0

    .line 1247
    :cond_3
    iget-object v2, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    iget-object v2, v2, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mLocationAddress:Landroid/widget/TextView;

    const/16 v3, 0x8

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_1
.end method

.method updateExportIcons()V
    .locals 4

    .prologue
    const/16 v2, 0x8

    const/4 v1, 0x0

    .line 890
    iget-object v0, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    iget-object v3, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mFbIcon:Landroid/view/View;

    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->exportToFacebook:Z

    if-eqz v0, :cond_0

    move v0, v1

    :goto_0
    invoke-virtual {v3, v0}, Landroid/view/View;->setVisibility(I)V

    .line 891
    iget-object v0, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    iget-object v3, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mTwitterIcon:Landroid/view/View;

    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->exportToTwitter:Z

    if-eqz v0, :cond_1

    move v0, v1

    :goto_1
    invoke-virtual {v3, v0}, Landroid/view/View;->setVisibility(I)V

    .line 892
    iget-object v0, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mFriendsOnlyIcon:Landroid/view/View;

    iget-boolean v3, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->friendsOnly:Z

    if-eqz v3, :cond_2

    :goto_2
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 893
    return-void

    :cond_0
    move v0, v2

    .line 890
    goto :goto_0

    :cond_1
    move v0, v2

    .line 891
    goto :goto_1

    :cond_2
    move v1, v2

    .line 892
    goto :goto_2
.end method

.method updateFieldSize()V
    .locals 4

    .prologue
    const/4 v1, -0x1

    .line 878
    iget-object v0, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    iget-object v2, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mStatusEdit:Landroid/widget/EditText;

    new-instance v3, Landroid/widget/LinearLayout$LayoutParams;

    iget-object v0, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    iget-object v0, v0, Lcom/vkontakte/android/fragments/news/NewPostFragment;->attachView:Lcom/vkontakte/android/ui/AttachmentsEditorView;

    invoke-virtual {v0}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->getVisibility()I

    move-result v0

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->signedFromGroup:Z

    if-eqz v0, :cond_1

    :cond_0
    const/4 v0, -0x2

    :goto_0
    invoke-direct {v3, v1, v0}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v2, v3}, Landroid/widget/EditText;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 879
    return-void

    :cond_1
    move v0, v1

    .line 878
    goto :goto_0
.end method

.method updateSendButton()V
    .locals 2

    .prologue
    .line 1252
    iget-object v1, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    iget-object v1, v1, Lcom/vkontakte/android/fragments/news/NewPostFragment;->mStatusEdit:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-gtz v1, :cond_0

    iget-object v1, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    iget-object v1, v1, Lcom/vkontakte/android/fragments/news/NewPostFragment;->attachView:Lcom/vkontakte/android/ui/AttachmentsEditorView;

    invoke-virtual {v1}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->getCount()I

    move-result v1

    if-gtz v1, :cond_0

    iget-object v1, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->geoAttach:Lcom/vkontakte/android/attachments/GeoAttachment;

    if-eqz v1, :cond_1

    :cond_0
    iget-object v1, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    iget-object v1, v1, Lcom/vkontakte/android/fragments/news/NewPostFragment;->attachView:Lcom/vkontakte/android/ui/AttachmentsEditorView;

    invoke-virtual {v1}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->isUploading()Z

    move-result v1

    if-nez v1, :cond_1

    const/4 v0, 0x1

    .line 1253
    .local v0, "enable":Z
    :goto_0
    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->sendEnabled(Z)V

    .line 1254
    return-void

    .line 1252
    .end local v0    # "enable":Z
    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method updateTimer()V
    .locals 6

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 962
    iget-object v1, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    iget-object v1, v1, Lcom/vkontakte/android/fragments/news/NewPostFragment;->optionsAlertView:Landroid/widget/ListView;

    if-eqz v1, :cond_0

    .line 963
    iget-object v1, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    iget-object v4, v1, Lcom/vkontakte/android/fragments/news/NewPostFragment;->optionsAlertView:Landroid/widget/ListView;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    iget-object v1, v1, Lcom/vkontakte/android/fragments/news/NewPostFragment;->optionsAlertView:Landroid/widget/ListView;

    invoke-virtual {v1}, Landroid/widget/ListView;->getCount()I

    move-result v1

    add-int/lit8 v5, v1, -0x1

    iget-object v1, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->postponeTo:Ljava/util/Calendar;

    if-eqz v1, :cond_1

    move v1, v2

    :goto_0
    invoke-virtual {v4, v5, v1}, Landroid/widget/ListView;->setItemChecked(IZ)V

    .line 964
    iget-object v1, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    iget-object v1, v1, Lcom/vkontakte/android/fragments/news/NewPostFragment;->optionsAlertView:Landroid/widget/ListView;

    invoke-virtual {v1}, Landroid/widget/ListView;->getTag()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, [Z

    move-object v0, v1

    check-cast v0, [Z

    .line 965
    .local v0, "opts":[Z
    iget-object v1, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->this$0:Lcom/vkontakte/android/fragments/news/NewPostFragment;

    iget-object v1, v1, Lcom/vkontakte/android/fragments/news/NewPostFragment;->optionsAlertView:Landroid/widget/ListView;

    invoke-virtual {v1}, Landroid/widget/ListView;->getCount()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    iget-object v4, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->postponeTo:Ljava/util/Calendar;

    if-eqz v4, :cond_2

    :goto_1
    aput-boolean v2, v0, v1

    .line 967
    .end local v0    # "opts":[Z
    :cond_0
    iget-object v1, p0, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->postponeTo:Ljava/util/Calendar;

    if-nez v1, :cond_3

    const v1, 0x7f0805f7

    :goto_2
    invoke-virtual {p0, v1}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->sendText(I)V

    .line 968
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Presenter;->updateBottomLine()V

    .line 969
    return-void

    :cond_1
    move v1, v3

    .line 963
    goto :goto_0

    .restart local v0    # "opts":[Z
    :cond_2
    move v2, v3

    .line 965
    goto :goto_1

    .line 967
    .end local v0    # "opts":[Z
    :cond_3
    const v1, 0x7f080706

    goto :goto_2
.end method
