.class public final Lcom/vk/sharing/SharingActivity;
.super Lcom/vkontakte/android/VKActivity;
.source "SharingActivity.java"

# interfaces
.implements Lcom/vk/sharing/BasePresenter$DelegateContext;
.implements Lcom/vk/sharing/view/SharingView$Presenter;
.implements Lcom/vk/sharing/target/TargetsLoader$Callback;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vk/sharing/SharingActivity$PresenterDelegateToIntAdapter;,
        Lcom/vk/sharing/SharingActivity$NonConfigurationInstances;
    }
.end annotation


# static fields
.field static final EXTRA_ACTIONS_INFO:Ljava/lang/String; = "actions_info"

.field static final EXTRA_ATTACHMENT_INFO:Ljava/lang/String; = "attachment_info"

.field public static final EXTRA_FULLSCREEN:Ljava/lang/String; = "fullscreen"

.field public static final EXTRA_MODE:Ljava/lang/String; = "mode"

.field static final EXTRA_PICKER_INFO:Ljava/lang/String; = "picker_info"

.field public static final MODE_DEFAULT:I = 0x0

.field public static final MODE_GROUP_PICKER:I = 0x1

.field public static final RESULT_EXTRA_TARGET:Ljava/lang/String; = "result_target"

.field private static final STATE_DELEGATE:Ljava/lang/String; = "STATE_DELEGATE"

.field private static final STATE_TARGETS:Ljava/lang/String; = "STATE_TARGETS"


# instance fields
.field private actionsInfo:Lcom/vk/sharing/action/ActionsInfo;

.field private attachmentInfo:Lcom/vk/sharing/attachment/AttachmentInfo;

.field private attachmentViewHolder:Lcom/vk/sharing/attachment/AttachmentViewHolder;

.field private delegate:Lcom/vk/sharing/BasePresenter;

.field private groupPickerInfo:Lcom/vk/sharing/picker/GroupPickerInfo;

.field private logoutReceiver:Lcom/vkontakte/android/activities/LogoutReceiver;

.field private resultIntent:Landroid/content/Intent;

.field private succeeded:Z

.field private targets:Lcom/vk/sharing/target/Targets;

.field private targetsLoader:Lcom/vk/sharing/target/TargetsLoader;

.field private view:Lcom/vk/sharing/view/SharingView;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 36
    invoke-direct {p0}, Lcom/vkontakte/android/VKActivity;-><init>()V

    .line 74
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vk/sharing/SharingActivity;->succeeded:Z

    .line 76
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vk/sharing/SharingActivity;->resultIntent:Landroid/content/Intent;

    return-void
.end method


# virtual methods
.method public copyLink()V
    .locals 3

    .prologue
    .line 172
    const-string/jumbo v1, "clipboard"

    invoke-virtual {p0, v1}, Lcom/vk/sharing/SharingActivity;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/ClipboardManager;

    .line 173
    .local v0, "manager":Landroid/content/ClipboardManager;
    const-string/jumbo v1, "VK link"

    iget-object v2, p0, Lcom/vk/sharing/SharingActivity;->attachmentInfo:Lcom/vk/sharing/attachment/AttachmentInfo;

    invoke-static {v2}, Lcom/vk/sharing/attachment/Attachments;->createLink(Lcom/vk/sharing/attachment/AttachmentInfo;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/content/ClipData;->newPlainText(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Landroid/content/ClipData;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/ClipboardManager;->setPrimaryClip(Landroid/content/ClipData;)V

    .line 174
    const v1, 0x7f080688

    invoke-virtual {p0, v1}, Lcom/vk/sharing/SharingActivity;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/vk/core/util/ToastUtils;->showToast(Ljava/lang/String;)V

    .line 175
    return-void
.end method

.method public destroy()V
    .locals 2

    .prologue
    .line 180
    iget-boolean v0, p0, Lcom/vk/sharing/SharingActivity;->succeeded:Z

    if-eqz v0, :cond_0

    const/4 v0, -0x1

    :goto_0
    iget-object v1, p0, Lcom/vk/sharing/SharingActivity;->resultIntent:Landroid/content/Intent;

    invoke-virtual {p0, v0, v1}, Lcom/vk/sharing/SharingActivity;->setResult(ILandroid/content/Intent;)V

    .line 182
    invoke-virtual {p0}, Lcom/vk/sharing/SharingActivity;->finish()V

    .line 183
    return-void

    .line 180
    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public finish()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 395
    invoke-super {p0}, Lcom/vkontakte/android/VKActivity;->finish()V

    .line 396
    invoke-virtual {p0, v0, v0}, Lcom/vk/sharing/SharingActivity;->overridePendingTransition(II)V

    .line 397
    return-void
.end method

.method public getActionsInfo()Lcom/vk/sharing/action/ActionsInfo;
    .locals 1
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 97
    iget-object v0, p0, Lcom/vk/sharing/SharingActivity;->actionsInfo:Lcom/vk/sharing/action/ActionsInfo;

    return-object v0
.end method

.method public getGroupPickerInfo()Lcom/vk/sharing/picker/GroupPickerInfo;
    .locals 1

    .prologue
    .line 162
    iget-object v0, p0, Lcom/vk/sharing/SharingActivity;->groupPickerInfo:Lcom/vk/sharing/picker/GroupPickerInfo;

    return-object v0
.end method

.method public getTargets()Lcom/vk/sharing/target/Targets;
    .locals 1
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 91
    iget-object v0, p0, Lcom/vk/sharing/SharingActivity;->targets:Lcom/vk/sharing/target/Targets;

    return-object v0
.end method

.method public getTargetsLoader()Lcom/vk/sharing/target/TargetsLoader;
    .locals 1
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 103
    iget-object v0, p0, Lcom/vk/sharing/SharingActivity;->targetsLoader:Lcom/vk/sharing/target/TargetsLoader;

    return-object v0
.end method

.method public getView()Lcom/vk/sharing/view/SharingView;
    .locals 1
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 109
    iget-object v0, p0, Lcom/vk/sharing/SharingActivity;->view:Lcom/vk/sharing/view/SharingView;

    return-object v0
.end method

.method public handlePickedTarget(Lcom/vk/sharing/target/Target;)V
    .locals 2
    .param p1, "target"    # Lcom/vk/sharing/target/Target;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 155
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    iput-object v0, p0, Lcom/vk/sharing/SharingActivity;->resultIntent:Landroid/content/Intent;

    .line 156
    iget-object v0, p0, Lcom/vk/sharing/SharingActivity;->resultIntent:Landroid/content/Intent;

    const-string/jumbo v1, "result_target"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 157
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vk/sharing/SharingActivity;->succeeded:Z

    .line 158
    return-void
.end method

.method public onActionClick(I)V
    .locals 1
    .param p1, "action"    # I

    .prologue
    .line 216
    iget-object v0, p0, Lcom/vk/sharing/SharingActivity;->delegate:Lcom/vk/sharing/BasePresenter;

    invoke-virtual {v0, p1}, Lcom/vk/sharing/BasePresenter;->onActionClick(I)V

    .line 217
    return-void
.end method

.method public onBackClick()V
    .locals 1

    .prologue
    .line 246
    iget-object v0, p0, Lcom/vk/sharing/SharingActivity;->delegate:Lcom/vk/sharing/BasePresenter;

    invoke-virtual {v0}, Lcom/vk/sharing/BasePresenter;->onBackClick()V

    .line 247
    return-void
.end method

.method public onBackPressed()V
    .locals 1

    .prologue
    .line 390
    iget-object v0, p0, Lcom/vk/sharing/SharingActivity;->view:Lcom/vk/sharing/view/SharingView;

    invoke-virtual {v0}, Lcom/vk/sharing/view/SharingView;->onBackPressed()V

    .line 391
    return-void
.end method

.method public onClearClick()V
    .locals 1

    .prologue
    .line 236
    iget-object v0, p0, Lcom/vk/sharing/SharingActivity;->delegate:Lcom/vk/sharing/BasePresenter;

    invoke-virtual {v0}, Lcom/vk/sharing/BasePresenter;->onClearClick()V

    .line 237
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 9
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    const/4 v8, -0x1

    const/4 v7, 0x0

    .line 299
    invoke-virtual {p0}, Lcom/vk/sharing/SharingActivity;->getIntent()Landroid/content/Intent;

    move-result-object v5

    const-string/jumbo v6, "fullscreen"

    invoke-virtual {v5, v6, v7}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 301
    invoke-virtual {p0}, Lcom/vk/sharing/SharingActivity;->getWindow()Landroid/view/Window;

    move-result-object v5

    invoke-virtual {v5}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v1

    .line 302
    .local v1, "decorView":Landroid/view/View;
    const/4 v4, 0x4

    .line 303
    .local v4, "uiOptions":I
    invoke-virtual {v1, v4}, Landroid/view/View;->setSystemUiVisibility(I)V

    .line 306
    .end local v1    # "decorView":Landroid/view/View;
    .end local v4    # "uiOptions":I
    :cond_0
    invoke-virtual {p0, v7, v7}, Lcom/vk/sharing/SharingActivity;->overridePendingTransition(II)V

    .line 307
    invoke-super {p0, p1}, Lcom/vkontakte/android/VKActivity;->onCreate(Landroid/os/Bundle;)V

    .line 308
    new-instance v5, Lcom/vk/sharing/view/SharingView;

    invoke-direct {v5, p0}, Lcom/vk/sharing/view/SharingView;-><init>(Landroid/content/Context;)V

    iput-object v5, p0, Lcom/vk/sharing/SharingActivity;->view:Lcom/vk/sharing/view/SharingView;

    .line 309
    iget-object v5, p0, Lcom/vk/sharing/SharingActivity;->view:Lcom/vk/sharing/view/SharingView;

    new-instance v6, Landroid/view/ViewGroup$LayoutParams;

    invoke-direct {v6, v8, v8}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    invoke-virtual {p0, v5, v6}, Lcom/vk/sharing/SharingActivity;->setContentView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 311
    invoke-virtual {p0}, Lcom/vk/sharing/SharingActivity;->getIntent()Landroid/content/Intent;

    move-result-object v5

    const-string/jumbo v6, "attachment_info"

    invoke-virtual {v5, v6}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v5

    check-cast v5, Lcom/vk/sharing/attachment/AttachmentInfo;

    iput-object v5, p0, Lcom/vk/sharing/SharingActivity;->attachmentInfo:Lcom/vk/sharing/attachment/AttachmentInfo;

    .line 312
    invoke-virtual {p0}, Lcom/vk/sharing/SharingActivity;->getIntent()Landroid/content/Intent;

    move-result-object v5

    const-string/jumbo v6, "actions_info"

    invoke-virtual {v5, v6}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/vk/sharing/action/ActionsInfo;

    .line 314
    .local v0, "actionsInfo":Lcom/vk/sharing/action/ActionsInfo;
    invoke-virtual {p0}, Lcom/vk/sharing/SharingActivity;->getLastCustomNonConfigurationInstance()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/vk/sharing/SharingActivity$NonConfigurationInstances;

    .line 315
    .local v3, "nci":Lcom/vk/sharing/SharingActivity$NonConfigurationInstances;
    if-nez v3, :cond_4

    .line 316
    new-instance v5, Lcom/vk/sharing/target/TargetsLoader;

    invoke-direct {v5}, Lcom/vk/sharing/target/TargetsLoader;-><init>()V

    iput-object v5, p0, Lcom/vk/sharing/SharingActivity;->targetsLoader:Lcom/vk/sharing/target/TargetsLoader;

    .line 317
    iget-object v5, p0, Lcom/vk/sharing/SharingActivity;->attachmentInfo:Lcom/vk/sharing/attachment/AttachmentInfo;

    if-eqz v5, :cond_1

    .line 318
    iget-object v5, p0, Lcom/vk/sharing/SharingActivity;->attachmentInfo:Lcom/vk/sharing/attachment/AttachmentInfo;

    invoke-static {v5}, Lcom/vk/sharing/attachment/Attachments;->createViewHolder(Lcom/vk/sharing/attachment/AttachmentInfo;)Lcom/vk/sharing/attachment/AttachmentViewHolder;

    move-result-object v5

    iput-object v5, p0, Lcom/vk/sharing/SharingActivity;->attachmentViewHolder:Lcom/vk/sharing/attachment/AttachmentViewHolder;

    .line 325
    :cond_1
    :goto_0
    iget-object v5, p0, Lcom/vk/sharing/SharingActivity;->attachmentViewHolder:Lcom/vk/sharing/attachment/AttachmentViewHolder;

    if-eqz v5, :cond_2

    .line 326
    iget-object v5, p0, Lcom/vk/sharing/SharingActivity;->view:Lcom/vk/sharing/view/SharingView;

    iget-object v6, p0, Lcom/vk/sharing/SharingActivity;->attachmentViewHolder:Lcom/vk/sharing/attachment/AttachmentViewHolder;

    invoke-virtual {v5, v6}, Lcom/vk/sharing/view/SharingView;->setAttachmentViewHolder(Lcom/vk/sharing/attachment/AttachmentViewHolder;)V

    .line 329
    :cond_2
    if-eqz v0, :cond_3

    .line 330
    iget-object v5, p0, Lcom/vk/sharing/SharingActivity;->view:Lcom/vk/sharing/view/SharingView;

    invoke-virtual {v5, v0}, Lcom/vk/sharing/view/SharingView;->setActionsInfo(Lcom/vk/sharing/action/ActionsInfo;)V

    .line 333
    :cond_3
    iput-object v0, p0, Lcom/vk/sharing/SharingActivity;->actionsInfo:Lcom/vk/sharing/action/ActionsInfo;

    .line 335
    if-nez p1, :cond_5

    .line 336
    invoke-virtual {p0}, Lcom/vk/sharing/SharingActivity;->getIntent()Landroid/content/Intent;

    move-result-object v5

    const-string/jumbo v6, "mode"

    invoke-virtual {v5, v6, v7}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v2

    .line 337
    .local v2, "mode":I
    new-instance v5, Lcom/vk/sharing/target/Targets;

    invoke-direct {v5}, Lcom/vk/sharing/target/Targets;-><init>()V

    iput-object v5, p0, Lcom/vk/sharing/SharingActivity;->targets:Lcom/vk/sharing/target/Targets;

    .line 339
    packed-switch v2, :pswitch_data_0

    .line 345
    new-instance v5, Lcom/vk/sharing/CommonPresenter;

    const/4 v6, 0x1

    invoke-direct {v5, p0, v6}, Lcom/vk/sharing/CommonPresenter;-><init>(Lcom/vk/sharing/BasePresenter$DelegateContext;Z)V

    iput-object v5, p0, Lcom/vk/sharing/SharingActivity;->delegate:Lcom/vk/sharing/BasePresenter;

    .line 353
    .end local v2    # "mode":I
    :goto_1
    iget-object v5, p0, Lcom/vk/sharing/SharingActivity;->view:Lcom/vk/sharing/view/SharingView;

    invoke-virtual {v5, p0}, Lcom/vk/sharing/view/SharingView;->setPresenter(Lcom/vk/sharing/view/SharingView$Presenter;)V

    .line 354
    iget-object v5, p0, Lcom/vk/sharing/SharingActivity;->targetsLoader:Lcom/vk/sharing/target/TargetsLoader;

    invoke-virtual {v5, p0}, Lcom/vk/sharing/target/TargetsLoader;->setCallback(Lcom/vk/sharing/target/TargetsLoader$Callback;)V

    .line 355
    return-void

    .line 321
    :cond_4
    invoke-static {v3}, Lcom/vk/sharing/SharingActivity$NonConfigurationInstances;->access$000(Lcom/vk/sharing/SharingActivity$NonConfigurationInstances;)Lcom/vk/sharing/target/TargetsLoader;

    move-result-object v5

    iput-object v5, p0, Lcom/vk/sharing/SharingActivity;->targetsLoader:Lcom/vk/sharing/target/TargetsLoader;

    .line 322
    invoke-static {v3}, Lcom/vk/sharing/SharingActivity$NonConfigurationInstances;->access$100(Lcom/vk/sharing/SharingActivity$NonConfigurationInstances;)Lcom/vk/sharing/attachment/AttachmentViewHolder;

    move-result-object v5

    iput-object v5, p0, Lcom/vk/sharing/SharingActivity;->attachmentViewHolder:Lcom/vk/sharing/attachment/AttachmentViewHolder;

    goto :goto_0

    .line 341
    .restart local v2    # "mode":I
    :pswitch_0
    invoke-virtual {p0}, Lcom/vk/sharing/SharingActivity;->getIntent()Landroid/content/Intent;

    move-result-object v5

    const-string/jumbo v6, "picker_info"

    invoke-virtual {v5, v6}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v5

    check-cast v5, Lcom/vk/sharing/picker/GroupPickerInfo;

    iput-object v5, p0, Lcom/vk/sharing/SharingActivity;->groupPickerInfo:Lcom/vk/sharing/picker/GroupPickerInfo;

    .line 342
    new-instance v5, Lcom/vk/sharing/GroupPickerPresenter;

    invoke-direct {v5, p0}, Lcom/vk/sharing/GroupPickerPresenter;-><init>(Lcom/vk/sharing/BasePresenter$DelegateContext;)V

    iput-object v5, p0, Lcom/vk/sharing/SharingActivity;->delegate:Lcom/vk/sharing/BasePresenter;

    goto :goto_1

    .line 349
    .end local v2    # "mode":I
    :cond_5
    const-string/jumbo v5, "STATE_TARGETS"

    invoke-virtual {p1, v5}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v5

    check-cast v5, Lcom/vk/sharing/target/Targets;

    iput-object v5, p0, Lcom/vk/sharing/SharingActivity;->targets:Lcom/vk/sharing/target/Targets;

    .line 350
    const-string/jumbo v5, "STATE_DELEGATE"

    invoke-virtual {p1, v5}, Landroid/os/Bundle;->getInt(Ljava/lang/String;)I

    move-result v5

    invoke-static {p0, v5}, Lcom/vk/sharing/SharingActivity$PresenterDelegateToIntAdapter;->toDelegate(Lcom/vk/sharing/SharingActivity;I)Lcom/vk/sharing/BasePresenter;

    move-result-object v5

    iput-object v5, p0, Lcom/vk/sharing/SharingActivity;->delegate:Lcom/vk/sharing/BasePresenter;

    goto :goto_1

    .line 339
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
    .end packed-switch
.end method

.method protected onDestroy()V
    .locals 2

    .prologue
    .line 384
    iget-object v0, p0, Lcom/vk/sharing/SharingActivity;->targetsLoader:Lcom/vk/sharing/target/TargetsLoader;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/vk/sharing/target/TargetsLoader;->setCallback(Lcom/vk/sharing/target/TargetsLoader$Callback;)V

    .line 385
    invoke-super {p0}, Lcom/vkontakte/android/VKActivity;->onDestroy()V

    .line 386
    return-void
.end method

.method public onDialogLoadingCompleted(Ljava/util/ArrayList;)V
    .locals 1
    .param p1    # Ljava/util/ArrayList;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vk/sharing/target/Target;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 260
    .local p1, "targets":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vk/sharing/target/Target;>;"
    iget-object v0, p0, Lcom/vk/sharing/SharingActivity;->delegate:Lcom/vk/sharing/BasePresenter;

    invoke-virtual {v0, p1}, Lcom/vk/sharing/BasePresenter;->onDialogLoadingCompleted(Ljava/util/ArrayList;)V

    .line 261
    return-void
.end method

.method public onDialogLoadingFailed()V
    .locals 1

    .prologue
    .line 265
    iget-object v0, p0, Lcom/vk/sharing/SharingActivity;->delegate:Lcom/vk/sharing/BasePresenter;

    invoke-virtual {v0}, Lcom/vk/sharing/BasePresenter;->onDialogLoadingFailed()V

    .line 266
    return-void
.end method

.method public onDialogSearchingCompleted(Ljava/util/ArrayList;)V
    .locals 1
    .param p1    # Ljava/util/ArrayList;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vk/sharing/target/Target;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 270
    .local p1, "targets":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vk/sharing/target/Target;>;"
    iget-object v0, p0, Lcom/vk/sharing/SharingActivity;->delegate:Lcom/vk/sharing/BasePresenter;

    invoke-virtual {v0, p1}, Lcom/vk/sharing/BasePresenter;->onDialogSearchingCompleted(Ljava/util/ArrayList;)V

    .line 271
    return-void
.end method

.method public onDialogSearchingFailed()V
    .locals 1

    .prologue
    .line 275
    iget-object v0, p0, Lcom/vk/sharing/SharingActivity;->delegate:Lcom/vk/sharing/BasePresenter;

    invoke-virtual {v0}, Lcom/vk/sharing/BasePresenter;->onDialogSearchingFailed()V

    .line 276
    return-void
.end method

.method public onGroupLoadingCompleted(Ljava/util/ArrayList;)V
    .locals 1
    .param p1    # Ljava/util/ArrayList;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vk/sharing/target/Target;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 280
    .local p1, "targets":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vk/sharing/target/Target;>;"
    iget-object v0, p0, Lcom/vk/sharing/SharingActivity;->delegate:Lcom/vk/sharing/BasePresenter;

    invoke-virtual {v0, p1}, Lcom/vk/sharing/BasePresenter;->onGroupLoadingCompleted(Ljava/util/ArrayList;)V

    .line 281
    return-void
.end method

.method public onGroupLoadingFailed()V
    .locals 1

    .prologue
    .line 285
    iget-object v0, p0, Lcom/vk/sharing/SharingActivity;->delegate:Lcom/vk/sharing/BasePresenter;

    invoke-virtual {v0}, Lcom/vk/sharing/BasePresenter;->onGroupLoadingFailed()V

    .line 286
    return-void
.end method

.method public onGroupSearchingCompleted(Ljava/util/ArrayList;)V
    .locals 1
    .param p1    # Ljava/util/ArrayList;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vk/sharing/target/Target;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 290
    .local p1, "targets":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vk/sharing/target/Target;>;"
    iget-object v0, p0, Lcom/vk/sharing/SharingActivity;->delegate:Lcom/vk/sharing/BasePresenter;

    invoke-virtual {v0, p1}, Lcom/vk/sharing/BasePresenter;->onGroupSearchingCompleted(Ljava/util/ArrayList;)V

    .line 291
    return-void
.end method

.method public onListItemClick(Lcom/vk/sharing/target/Target;I)V
    .locals 1
    .param p1, "target"    # Lcom/vk/sharing/target/Target;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "position"    # I

    .prologue
    .line 221
    iget-object v0, p0, Lcom/vk/sharing/SharingActivity;->delegate:Lcom/vk/sharing/BasePresenter;

    invoke-virtual {v0, p1, p2}, Lcom/vk/sharing/BasePresenter;->onListItemClick(Lcom/vk/sharing/target/Target;I)V

    .line 222
    return-void
.end method

.method public onListScrolledToTheEnd()V
    .locals 1

    .prologue
    .line 206
    iget-object v0, p0, Lcom/vk/sharing/SharingActivity;->delegate:Lcom/vk/sharing/BasePresenter;

    invoke-virtual {v0}, Lcom/vk/sharing/BasePresenter;->onListScrolledToTheEnd()V

    .line 207
    return-void
.end method

.method public onOutsideClick()V
    .locals 1

    .prologue
    .line 211
    iget-object v0, p0, Lcom/vk/sharing/SharingActivity;->delegate:Lcom/vk/sharing/BasePresenter;

    invoke-virtual {v0}, Lcom/vk/sharing/BasePresenter;->onOutsideClick()V

    .line 212
    return-void
.end method

.method public onPause()V
    .locals 0

    .prologue
    .line 370
    invoke-static {}, Lcom/vkontakte/android/AppStateTracker;->onActivityPaused()V

    .line 371
    invoke-super {p0}, Lcom/vkontakte/android/VKActivity;->onPause()V

    .line 372
    return-void
.end method

.method public onResume()V
    .locals 0

    .prologue
    .line 365
    invoke-super {p0}, Lcom/vkontakte/android/VKActivity;->onResume()V

    .line 366
    invoke-static {p0}, Lcom/vkontakte/android/AppStateTracker;->onActivityResumed(Landroid/app/Activity;)V

    .line 367
    return-void
.end method

.method public onRetainCustomNonConfigurationInstance()Ljava/lang/Object;
    .locals 2

    .prologue
    .line 401
    new-instance v0, Lcom/vk/sharing/SharingActivity$NonConfigurationInstances;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/vk/sharing/SharingActivity$NonConfigurationInstances;-><init>(Lcom/vk/sharing/SharingActivity$1;)V

    .line 402
    .local v0, "nci":Lcom/vk/sharing/SharingActivity$NonConfigurationInstances;
    iget-object v1, p0, Lcom/vk/sharing/SharingActivity;->targetsLoader:Lcom/vk/sharing/target/TargetsLoader;

    invoke-static {v0, v1}, Lcom/vk/sharing/SharingActivity$NonConfigurationInstances;->access$002(Lcom/vk/sharing/SharingActivity$NonConfigurationInstances;Lcom/vk/sharing/target/TargetsLoader;)Lcom/vk/sharing/target/TargetsLoader;

    .line 403
    iget-object v1, p0, Lcom/vk/sharing/SharingActivity;->attachmentViewHolder:Lcom/vk/sharing/attachment/AttachmentViewHolder;

    invoke-static {v0, v1}, Lcom/vk/sharing/SharingActivity$NonConfigurationInstances;->access$102(Lcom/vk/sharing/SharingActivity$NonConfigurationInstances;Lcom/vk/sharing/attachment/AttachmentViewHolder;)Lcom/vk/sharing/attachment/AttachmentViewHolder;

    .line 404
    return-object v0
.end method

.method public onRetryClick()V
    .locals 1

    .prologue
    .line 231
    iget-object v0, p0, Lcom/vk/sharing/SharingActivity;->delegate:Lcom/vk/sharing/BasePresenter;

    invoke-virtual {v0}, Lcom/vk/sharing/BasePresenter;->onRetryClick()V

    .line 232
    return-void
.end method

.method protected onSaveInstanceState(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "outState"    # Landroid/os/Bundle;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 409
    const-string/jumbo v0, "STATE_TARGETS"

    iget-object v1, p0, Lcom/vk/sharing/SharingActivity;->targets:Lcom/vk/sharing/target/Targets;

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 410
    const-string/jumbo v0, "STATE_DELEGATE"

    iget-object v1, p0, Lcom/vk/sharing/SharingActivity;->delegate:Lcom/vk/sharing/BasePresenter;

    invoke-static {v1}, Lcom/vk/sharing/SharingActivity$PresenterDelegateToIntAdapter;->fromDelegate(Lcom/vk/sharing/BasePresenter;)I

    move-result v1

    invoke-virtual {p1, v0, v1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 411
    invoke-super {p0, p1}, Lcom/vkontakte/android/VKActivity;->onSaveInstanceState(Landroid/os/Bundle;)V

    .line 412
    return-void
.end method

.method public onSearchClick()V
    .locals 1

    .prologue
    .line 241
    iget-object v0, p0, Lcom/vk/sharing/SharingActivity;->delegate:Lcom/vk/sharing/BasePresenter;

    invoke-virtual {v0}, Lcom/vk/sharing/BasePresenter;->onSearchClick()V

    .line 242
    return-void
.end method

.method public onSearchInputChanged(Ljava/lang/String;)V
    .locals 1
    .param p1, "query"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 251
    iget-object v0, p0, Lcom/vk/sharing/SharingActivity;->delegate:Lcom/vk/sharing/BasePresenter;

    invoke-virtual {v0, p1}, Lcom/vk/sharing/BasePresenter;->onSearchInputChanged(Ljava/lang/String;)V

    .line 252
    return-void
.end method

.method public onSendClick()V
    .locals 1

    .prologue
    .line 226
    iget-object v0, p0, Lcom/vk/sharing/SharingActivity;->delegate:Lcom/vk/sharing/BasePresenter;

    invoke-virtual {v0}, Lcom/vk/sharing/BasePresenter;->onSendClick()V

    .line 227
    return-void
.end method

.method protected onStart()V
    .locals 1

    .prologue
    .line 359
    invoke-super {p0}, Lcom/vkontakte/android/VKActivity;->onStart()V

    .line 361
    invoke-static {p0}, Lcom/vkontakte/android/activities/LogoutReceiver;->register(Landroid/app/Activity;)Lcom/vkontakte/android/activities/LogoutReceiver;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/sharing/SharingActivity;->logoutReceiver:Lcom/vkontakte/android/activities/LogoutReceiver;

    .line 362
    return-void
.end method

.method protected onStop()V
    .locals 1

    .prologue
    .line 376
    iget-object v0, p0, Lcom/vk/sharing/SharingActivity;->logoutReceiver:Lcom/vkontakte/android/activities/LogoutReceiver;

    invoke-virtual {v0}, Lcom/vkontakte/android/activities/LogoutReceiver;->unregister()V

    .line 377
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vk/sharing/SharingActivity;->logoutReceiver:Lcom/vkontakte/android/activities/LogoutReceiver;

    .line 379
    invoke-super {p0}, Lcom/vkontakte/android/VKActivity;->onStop()V

    .line 380
    return-void
.end method

.method public onViewHidden()V
    .locals 1

    .prologue
    .line 201
    iget-object v0, p0, Lcom/vk/sharing/SharingActivity;->delegate:Lcom/vk/sharing/BasePresenter;

    invoke-virtual {v0}, Lcom/vk/sharing/BasePresenter;->onViewHidden()V

    .line 202
    return-void
.end method

.method public onViewShown()V
    .locals 1

    .prologue
    .line 196
    iget-object v0, p0, Lcom/vk/sharing/SharingActivity;->delegate:Lcom/vk/sharing/BasePresenter;

    invoke-virtual {v0}, Lcom/vk/sharing/BasePresenter;->onViewShown()V

    .line 197
    return-void
.end method

.method public repost(Ljava/lang/String;)V
    .locals 3
    .param p1, "message"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 114
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/vk/sharing/SharingService;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 115
    .local v0, "intent":Landroid/content/Intent;
    const-string/jumbo v1, "call"

    const/4 v2, 0x2

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 116
    const-string/jumbo v1, "attachment_info"

    iget-object v2, p0, Lcom/vk/sharing/SharingActivity;->attachmentInfo:Lcom/vk/sharing/attachment/AttachmentInfo;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 117
    const-string/jumbo v1, "text"

    invoke-virtual {v0, v1, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 118
    invoke-virtual {p0, v0}, Lcom/vk/sharing/SharingActivity;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    .line 120
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/vk/sharing/SharingActivity;->succeeded:Z

    .line 121
    return-void
.end method

.method public repost(Ljava/lang/String;Ljava/util/Collection;)V
    .locals 4
    .param p1, "message"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/util/Collection;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Collection",
            "<",
            "Lcom/vk/sharing/target/Target;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 125
    .local p2, "targets":Ljava/util/Collection;, "Ljava/util/Collection<Lcom/vk/sharing/target/Target;>;"
    new-instance v0, Landroid/content/Intent;

    const-class v2, Lcom/vk/sharing/SharingService;

    invoke-direct {v0, p0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 126
    .local v0, "intent":Landroid/content/Intent;
    const-string/jumbo v2, "call"

    const/4 v3, 0x3

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 127
    const-string/jumbo v2, "attachment_info"

    iget-object v3, p0, Lcom/vk/sharing/SharingActivity;->attachmentInfo:Lcom/vk/sharing/attachment/AttachmentInfo;

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 128
    const-string/jumbo v2, "total_targets"

    invoke-interface {p2}, Ljava/util/Collection;->size()I

    move-result v3

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 129
    const-string/jumbo v2, "text"

    invoke-virtual {v0, v2, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 130
    invoke-interface {p2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vk/sharing/target/Target;

    .line 131
    .local v1, "target":Lcom/vk/sharing/target/Target;
    const-string/jumbo v3, "target"

    invoke-virtual {v0, v3, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 132
    invoke-virtual {p0, v0}, Lcom/vk/sharing/SharingActivity;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    goto :goto_0

    .line 135
    .end local v1    # "target":Lcom/vk/sharing/target/Target;
    :cond_0
    const/4 v2, 0x1

    iput-boolean v2, p0, Lcom/vk/sharing/SharingActivity;->succeeded:Z

    .line 136
    return-void
.end method

.method public sendMessage(Ljava/lang/String;Ljava/util/Collection;)V
    .locals 5
    .param p1, "message"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/util/Collection;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Collection",
            "<",
            "Lcom/vk/sharing/target/Target;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p2, "targets":Ljava/util/Collection;, "Ljava/util/Collection<Lcom/vk/sharing/target/Target;>;"
    const/4 v4, 0x1

    .line 140
    new-instance v0, Landroid/content/Intent;

    const-class v2, Lcom/vk/sharing/SharingService;

    invoke-direct {v0, p0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 141
    .local v0, "intent":Landroid/content/Intent;
    const-string/jumbo v2, "call"

    invoke-virtual {v0, v2, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 142
    const-string/jumbo v2, "attachment_info"

    iget-object v3, p0, Lcom/vk/sharing/SharingActivity;->attachmentInfo:Lcom/vk/sharing/attachment/AttachmentInfo;

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 143
    const-string/jumbo v2, "total_targets"

    invoke-interface {p2}, Ljava/util/Collection;->size()I

    move-result v3

    invoke-virtual {v0, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 144
    const-string/jumbo v2, "text"

    invoke-virtual {v0, v2, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 145
    invoke-interface {p2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vk/sharing/target/Target;

    .line 146
    .local v1, "target":Lcom/vk/sharing/target/Target;
    const-string/jumbo v3, "target"

    invoke-virtual {v0, v3, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    .line 147
    invoke-virtual {p0, v0}, Lcom/vk/sharing/SharingActivity;->startService(Landroid/content/Intent;)Landroid/content/ComponentName;

    goto :goto_0

    .line 150
    .end local v1    # "target":Lcom/vk/sharing/target/Target;
    :cond_0
    iput-boolean v4, p0, Lcom/vk/sharing/SharingActivity;->succeeded:Z

    .line 151
    return-void
.end method

.method public setNextPresenter(Lcom/vk/sharing/BasePresenter;)V
    .locals 0
    .param p1, "delegate"    # Lcom/vk/sharing/BasePresenter;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 187
    iput-object p1, p0, Lcom/vk/sharing/SharingActivity;->delegate:Lcom/vk/sharing/BasePresenter;

    .line 188
    return-void
.end method

.method public share()V
    .locals 1

    .prologue
    .line 167
    iget-object v0, p0, Lcom/vk/sharing/SharingActivity;->attachmentInfo:Lcom/vk/sharing/attachment/AttachmentInfo;

    invoke-static {v0}, Lcom/vk/sharing/attachment/Attachments;->createLink(Lcom/vk/sharing/attachment/AttachmentInfo;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p0, v0}, Lcom/vk/sharing/Sharing;->share(Landroid/content/Context;Ljava/lang/String;)V

    .line 168
    return-void
.end method
