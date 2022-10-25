.class public Lcom/vkontakte/android/fragments/SettingsListFragment;
.super Lcom/vkontakte/android/fragments/CardRecyclerFragment;
.source "SettingsListFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Lcom/vkontakte/android/functions/VoidF1;
.implements Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$DataDelegate;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/fragments/SettingsListFragment$Item;,
        Lcom/vkontakte/android/fragments/SettingsListFragment$SettingsAdapter;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/fragments/CardRecyclerFragment",
        "<",
        "Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;",
        ">;",
        "Landroid/view/View$OnClickListener;",
        "Lcom/vkontakte/android/functions/VoidF1",
        "<",
        "Lcom/vkontakte/android/fragments/SettingsListFragment$Item;",
        ">;",
        "Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$DataDelegate;"
    }
.end annotation


# static fields
.field private static final AVA_RESULT:I = 0xf3d


# instance fields
.field private final adapter:Lcom/vkontakte/android/fragments/SettingsListFragment$SettingsAdapter;

.field private headerView:Landroid/view/View;

.field private receiver:Landroid/content/BroadcastReceiver;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 78
    const/16 v0, 0xa

    invoke-direct {p0, v0}, Lcom/vkontakte/android/fragments/CardRecyclerFragment;-><init>(I)V

    .line 60
    new-instance v0, Lcom/vkontakte/android/fragments/SettingsListFragment$SettingsAdapter;

    invoke-direct {v0, p0, p0}, Lcom/vkontakte/android/fragments/SettingsListFragment$SettingsAdapter;-><init>(Lcom/vkontakte/android/fragments/SettingsListFragment;Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$DataDelegate;)V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/SettingsListFragment;->adapter:Lcom/vkontakte/android/fragments/SettingsListFragment$SettingsAdapter;

    .line 61
    new-instance v0, Lcom/vkontakte/android/fragments/SettingsListFragment$1;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/fragments/SettingsListFragment$1;-><init>(Lcom/vkontakte/android/fragments/SettingsListFragment;)V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/SettingsListFragment;->receiver:Landroid/content/BroadcastReceiver;

    .line 79
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/SettingsListFragment;->setRefreshEnabled(Z)V

    .line 80
    return-void
.end method

.method static synthetic access$000(Lcom/vkontakte/android/fragments/SettingsListFragment;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/SettingsListFragment;

    .prologue
    .line 55
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/SettingsListFragment;->updateOnlineState()V

    return-void
.end method

.method static synthetic access$100(Lcom/vkontakte/android/fragments/SettingsListFragment;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/SettingsListFragment;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 55
    invoke-direct {p0, p1}, Lcom/vkontakte/android/fragments/SettingsListFragment;->setUserPhoto(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$200(Lcom/vkontakte/android/fragments/SettingsListFragment;)Z
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/SettingsListFragment;

    .prologue
    .line 55
    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/SettingsListFragment;->isTablet:Z

    return v0
.end method

.method static synthetic access$300(Lcom/vkontakte/android/fragments/SettingsListFragment;)Landroid/view/View;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/SettingsListFragment;

    .prologue
    .line 55
    iget-object v0, p0, Lcom/vkontakte/android/fragments/SettingsListFragment;->headerView:Landroid/view/View;

    return-object v0
.end method

.method static synthetic access$400(Lcom/vkontakte/android/fragments/SettingsListFragment;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/SettingsListFragment;

    .prologue
    .line 55
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/SettingsListFragment;->confirmLogout()V

    return-void
.end method

.method private confirmLogout()V
    .locals 3

    .prologue
    .line 201
    new-instance v0, Lcom/vkontakte/android/VKAlertDialog$Builder;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/SettingsListFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/vkontakte/android/VKAlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v1, 0x7f080342

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/VKAlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f080341

    .line 202
    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f080798

    invoke-static {p0}, Lcom/vkontakte/android/fragments/SettingsListFragment$$Lambda$2;->lambdaFactory$(Lcom/vkontakte/android/fragments/SettingsListFragment;)Landroid/content/DialogInterface$OnClickListener;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f080433

    const/4 v2, 0x0

    .line 223
    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 224
    return-void
.end method

.method private deletePhoto()V
    .locals 3

    .prologue
    .line 188
    new-instance v0, Lcom/vkontakte/android/api/photos/PhotosDeleteAvatar;

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v1

    invoke-direct {v0, v1}, Lcom/vkontakte/android/api/photos/PhotosDeleteAvatar;-><init>(I)V

    new-instance v1, Lcom/vkontakte/android/fragments/SettingsListFragment$2;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/SettingsListFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-direct {v1, p0, v2}, Lcom/vkontakte/android/fragments/SettingsListFragment$2;-><init>(Lcom/vkontakte/android/fragments/SettingsListFragment;Landroid/content/Context;)V

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/photos/PhotosDeleteAvatar;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 197
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/SettingsListFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->wrapProgress(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/SettingsListFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 198
    return-void
.end method

.method private setUserPhoto(Ljava/lang/String;)V
    .locals 3
    .param p1, "photoSrc"    # Ljava/lang/String;

    .prologue
    .line 172
    iget-object v1, p0, Lcom/vkontakte/android/fragments/SettingsListFragment;->headerView:Landroid/view/View;

    const v2, 0x7f1001e8

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/vk/imageloader/view/VKImageView;

    .line 173
    .local v0, "photo":Lcom/vk/imageloader/view/VKImageView;
    invoke-virtual {v0, p1}, Lcom/vk/imageloader/view/VKImageView;->load(Ljava/lang/String;)V

    .line 174
    return-void
.end method

.method private updateOnlineState()V
    .locals 3

    .prologue
    .line 227
    iget-object v0, p0, Lcom/vkontakte/android/fragments/SettingsListFragment;->headerView:Landroid/view/View;

    if-nez v0, :cond_0

    .line 231
    :goto_0
    return-void

    .line 230
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/fragments/SettingsListFragment;->headerView:Landroid/view/View;

    const v1, 0x7f100378

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    invoke-static {}, Lcom/vkontakte/android/LongPollService;->getState()I

    move-result v1

    const/4 v2, 0x3

    if-ne v1, v2, :cond_1

    const v1, 0x7f08047d

    :goto_1
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    goto :goto_0

    :cond_1
    const v1, 0x7f080478

    goto :goto_1
.end method


# virtual methods
.method protected doLoadData(II)V
    .locals 2
    .param p1, "offset"    # I
    .param p2, "count"    # I

    .prologue
    .line 122
    iget-object v0, p0, Lcom/vkontakte/android/fragments/SettingsListFragment;->adapter:Lcom/vkontakte/android/fragments/SettingsListFragment$SettingsAdapter;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/SettingsListFragment$SettingsAdapter;->createData()Ljava/util/ArrayList;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/fragments/SettingsListFragment;->onDataLoaded(Ljava/util/List;Z)V

    .line 123
    return-void
.end method

.method public f(Lcom/vkontakte/android/fragments/SettingsListFragment$Item;)V
    .locals 3
    .param p1, "item"    # Lcom/vkontakte/android/fragments/SettingsListFragment$Item;

    .prologue
    .line 328
    iget-object v0, p1, Lcom/vkontakte/android/fragments/SettingsListFragment$Item;->navigator:Lcom/vkontakte/android/navigation/Navigator;

    if-eqz v0, :cond_0

    .line 329
    iget-object v0, p1, Lcom/vkontakte/android/fragments/SettingsListFragment$Item;->navigator:Lcom/vkontakte/android/navigation/Navigator;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/SettingsListFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/navigation/Navigator;->go(Landroid/content/Context;)Z

    .line 335
    :goto_0
    return-void

    .line 330
    :cond_0
    iget-object v0, p1, Lcom/vkontakte/android/fragments/SettingsListFragment$Item;->fragment:Ljava/lang/Class;

    if-eqz v0, :cond_1

    .line 331
    iget-object v0, p1, Lcom/vkontakte/android/fragments/SettingsListFragment$Item;->fragment:Ljava/lang/Class;

    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/SettingsListFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/vkontakte/android/navigation/Navigate;->to(Ljava/lang/Class;Landroid/os/Bundle;Landroid/content/Context;)V

    goto :goto_0

    .line 333
    :cond_1
    iget-object v0, p1, Lcom/vkontakte/android/fragments/SettingsListFragment$Item;->onClick:Ljava/lang/Runnable;

    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    goto :goto_0
.end method

.method public bridge synthetic f(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 55
    check-cast p1, Lcom/vkontakte/android/fragments/SettingsListFragment$Item;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/SettingsListFragment;->f(Lcom/vkontakte/android/fragments/SettingsListFragment$Item;)V

    return-void
.end method

.method protected getAdapter()Landroid/support/v7/widget/RecyclerView$Adapter;
    .locals 1

    .prologue
    .line 127
    iget-object v0, p0, Lcom/vkontakte/android/fragments/SettingsListFragment;->adapter:Lcom/vkontakte/android/fragments/SettingsListFragment$SettingsAdapter;

    return-object v0
.end method

.method public getData()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;",
            ">;"
        }
    .end annotation

    .prologue
    .line 117
    iget-object v0, p0, Lcom/vkontakte/android/fragments/SettingsListFragment;->data:Ljava/util/ArrayList;

    return-object v0
.end method

.method synthetic lambda$confirmLogout$1(Landroid/content/DialogInterface;I)V
    .locals 3
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 203
    new-instance v0, Landroid/app/ProgressDialog;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/SettingsListFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/app/ProgressDialog;-><init>(Landroid/content/Context;)V

    .line 204
    .local v0, "dlg":Landroid/app/ProgressDialog;
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/SettingsListFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f08033d

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setMessage(Ljava/lang/CharSequence;)V

    .line 205
    invoke-virtual {v0}, Landroid/app/ProgressDialog;->show()V

    .line 206
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x15

    if-ge v1, v2, :cond_0

    .line 207
    invoke-virtual {v0}, Landroid/app/ProgressDialog;->getWindow()Landroid/view/Window;

    move-result-object v1

    const v2, 0x7f0203d2

    invoke-virtual {v1, v2}, Landroid/view/Window;->setBackgroundDrawableResource(I)V

    .line 209
    :cond_0
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/app/ProgressDialog;->setCancelable(Z)V

    .line 210
    new-instance v1, Lcom/vkontakte/android/fragments/SettingsListFragment$3;

    invoke-direct {v1, p0, v0}, Lcom/vkontakte/android/fragments/SettingsListFragment$3;-><init>(Lcom/vkontakte/android/fragments/SettingsListFragment;Landroid/app/ProgressDialog;)V

    .line 222
    invoke-virtual {v1}, Lcom/vkontakte/android/fragments/SettingsListFragment$3;->start()V

    .line 223
    return-void
.end method

.method synthetic lambda$onActivityResult$0(Landroid/content/DialogInterface;I)V
    .locals 0
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 165
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/SettingsListFragment;->deletePhoto()V

    .line 166
    return-void
.end method

.method public onActivityResult(IILandroid/content/Intent;)V
    .locals 12
    .param p1, "reqCode"    # I
    .param p2, "resCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    const/16 v11, 0xf3d

    const/4 v4, 0x1

    const/4 v1, 0x0

    .line 150
    if-ne p1, v11, :cond_0

    const/4 v0, -0x1

    if-ne p2, v0, :cond_0

    .line 151
    const-string/jumbo v0, "cropLeft"

    invoke-virtual {p3, v0, v1}, Landroid/content/Intent;->getFloatExtra(Ljava/lang/String;F)F

    move-result v5

    .line 152
    .local v5, "cropLeft":F
    const-string/jumbo v0, "cropTop"

    invoke-virtual {p3, v0, v1}, Landroid/content/Intent;->getFloatExtra(Ljava/lang/String;F)F

    move-result v6

    .line 153
    .local v6, "cropTop":F
    const-string/jumbo v0, "cropRight"

    invoke-virtual {p3, v0, v1}, Landroid/content/Intent;->getFloatExtra(Ljava/lang/String;F)F

    move-result v7

    .line 154
    .local v7, "cropRight":F
    const-string/jumbo v0, "cropBottom"

    invoke-virtual {p3, v0, v1}, Landroid/content/Intent;->getFloatExtra(Ljava/lang/String;F)F

    move-result v8

    .line 155
    .local v8, "cropBottom":F
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/SettingsListFragment;->getActivity()Landroid/app/Activity;

    move-result-object v10

    new-instance v0, Lcom/vkontakte/android/upload/ProfilePhotoUploadTask;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/SettingsListFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    const-string/jumbo v2, "file"

    invoke-virtual {p3, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v3

    invoke-virtual {v3}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v3

    invoke-direct/range {v0 .. v8}, Lcom/vkontakte/android/upload/ProfilePhotoUploadTask;-><init>(Landroid/content/Context;Ljava/lang/String;IZFFFF)V

    invoke-static {v10, v0}, Lcom/vkontakte/android/upload/Upload;->start(Landroid/content/Context;Lcom/vkontakte/android/upload/UploadTask;)V

    .line 157
    .end local v5    # "cropLeft":F
    .end local v6    # "cropTop":F
    .end local v7    # "cropRight":F
    .end local v8    # "cropBottom":F
    :cond_0
    if-ne p1, v11, :cond_1

    if-ne p2, v4, :cond_1

    .line 158
    const-string/jumbo v0, "option"

    const/4 v1, 0x0

    invoke-virtual {p3, v0, v1}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v9

    .line 162
    .local v9, "idx":I
    if-nez v9, :cond_1

    .line 163
    new-instance v0, Lcom/vkontakte/android/VKAlertDialog$Builder;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/SettingsListFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/vkontakte/android/VKAlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v1, 0x7f080176

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/VKAlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f0801aa

    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f080798

    invoke-static {p0}, Lcom/vkontakte/android/fragments/SettingsListFragment$$Lambda$1;->lambdaFactory$(Lcom/vkontakte/android/fragments/SettingsListFragment;)Landroid/content/DialogInterface$OnClickListener;

    move-result-object v2

    .line 164
    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f080433

    const/4 v2, 0x0

    .line 166
    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 169
    .end local v9    # "idx":I
    :cond_1
    return-void
.end method

.method public onAttach(Landroid/app/Activity;)V
    .locals 5
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 84
    invoke-super {p0, p1}, Lcom/vkontakte/android/fragments/CardRecyclerFragment;->onAttach(Landroid/app/Activity;)V

    .line 85
    const v1, 0x7f08035a

    invoke-virtual {p0, v1}, Lcom/vkontakte/android/fragments/SettingsListFragment;->setTitle(I)V

    .line 86
    new-instance v0, Landroid/content/IntentFilter;

    const-string/jumbo v1, "com.vkontakte.android.STATE_CHANGED"

    invoke-direct {v0, v1}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    .line 87
    .local v0, "filter":Landroid/content/IntentFilter;
    const-string/jumbo v1, "com.vkontakte.android.USER_PHOTO_CHANGED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 88
    sget-object v1, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    iget-object v2, p0, Lcom/vkontakte/android/fragments/SettingsListFragment;->receiver:Landroid/content/BroadcastReceiver;

    const-string/jumbo v3, "com.vkontakte.android.permission.ACCESS_DATA"

    const/4 v4, 0x0

    invoke-virtual {v1, v2, v0, v3, v4}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;Ljava/lang/String;Landroid/os/Handler;)Landroid/content/Intent;

    .line 89
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/SettingsListFragment;->loadData()V

    .line 90
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 4
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 104
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v1

    sparse-switch v1, :sswitch_data_0

    .line 113
    :goto_0
    return-void

    .line 106
    :sswitch_0
    const-class v1, Lcom/vkontakte/android/fragments/ProfileEditFragment;

    new-instance v2, Landroid/os/Bundle;

    invoke-direct {v2}, Landroid/os/Bundle;-><init>()V

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/SettingsListFragment;->getActivity()Landroid/app/Activity;

    move-result-object v3

    invoke-static {v1, v2, v3}, Lcom/vkontakte/android/navigation/Navigate;->to(Ljava/lang/Class;Landroid/os/Bundle;Landroid/content/Context;)V

    goto :goto_0

    .line 109
    :sswitch_1
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vkontakte/android/auth/VKAccount;->getPhoto()Ljava/lang/String;

    move-result-object v0

    .line 110
    .local v0, "photoSrc":Ljava/lang/String;
    if-eqz v0, :cond_0

    const-string/jumbo v1, ".gif"

    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    const/4 v1, 0x1

    :goto_1
    invoke-virtual {p0, v1}, Lcom/vkontakte/android/fragments/SettingsListFragment;->showUpdatePhotoDlg(Z)V

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    goto :goto_1

    .line 104
    nop

    :sswitch_data_0
    .sparse-switch
        0x7f1001e8 -> :sswitch_1
        0x7f10052e -> :sswitch_0
    .end sparse-switch
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .locals 4
    .param p1, "newConfig"    # Landroid/content/res/Configuration;

    .prologue
    const v1, 0x7f0200e6

    const/4 v3, 0x3

    const/4 v2, 0x0

    .line 235
    invoke-super {p0, p1}, Lcom/vkontakte/android/fragments/CardRecyclerFragment;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 236
    iget-object v0, p0, Lcom/vkontakte/android/fragments/SettingsListFragment;->data:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/fragments/SettingsListFragment;->data:Ljava/util/ArrayList;

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

    iget v0, v0, Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;->type:I

    if-ne v0, v3, :cond_0

    .line 237
    iget-boolean v0, p0, Lcom/vkontakte/android/fragments/SettingsListFragment;->isTablet:Z

    if-eqz v0, :cond_1

    .line 238
    iget-object v0, p0, Lcom/vkontakte/android/fragments/SettingsListFragment;->data:Ljava/util/ArrayList;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {v3, v1}, Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;->top(ILjava/lang/Object;)Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

    move-result-object v1

    invoke-virtual {v0, v2, v1}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 243
    :cond_0
    :goto_0
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/SettingsListFragment;->updateDecorator()V

    .line 244
    return-void

    .line 240
    :cond_1
    iget-object v0, p0, Lcom/vkontakte/android/fragments/SettingsListFragment;->data:Ljava/util/ArrayList;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {v3, v1}, Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;->middle(ILjava/lang/Object;)Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

    move-result-object v1

    invoke-virtual {v0, v2, v1}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    goto :goto_0
.end method

.method public onCreateContentView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 4
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 132
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/SettingsListFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    const v2, 0x7f0301f7

    const/4 v3, 0x0

    invoke-static {v1, v2, v3}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lcom/vkontakte/android/fragments/SettingsListFragment;->headerView:Landroid/view/View;

    .line 133
    iget-object v1, p0, Lcom/vkontakte/android/fragments/SettingsListFragment;->headerView:Landroid/view/View;

    const v2, 0x7f1002ba

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v2

    invoke-virtual {v2}, Lcom/vkontakte/android/auth/VKAccount;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 134
    iget-object v1, p0, Lcom/vkontakte/android/fragments/SettingsListFragment;->headerView:Landroid/view/View;

    const v2, 0x7f1001e8

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    .line 135
    .local v0, "photo":Landroid/widget/ImageView;
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vkontakte/android/auth/VKAccount;->getPhoto()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lcom/vkontakte/android/fragments/SettingsListFragment;->setUserPhoto(Ljava/lang/String;)V

    .line 136
    iget-object v1, p0, Lcom/vkontakte/android/fragments/SettingsListFragment;->headerView:Landroid/view/View;

    const v2, 0x7f10052e

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 137
    invoke-virtual {v0, p0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 138
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/SettingsListFragment;->updateOnlineState()V

    .line 139
    invoke-super {p0, p1, p2, p3}, Lcom/vkontakte/android/fragments/CardRecyclerFragment;->onCreateContentView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;

    move-result-object v1

    return-object v1
.end method

.method public onDestroyView()V
    .locals 1

    .prologue
    .line 144
    invoke-super {p0}, Lcom/vkontakte/android/fragments/CardRecyclerFragment;->onDestroyView()V

    .line 145
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vkontakte/android/fragments/SettingsListFragment;->headerView:Landroid/view/View;

    .line 146
    return-void
.end method

.method public onDetach()V
    .locals 2

    .prologue
    .line 94
    invoke-super {p0}, Lcom/vkontakte/android/fragments/CardRecyclerFragment;->onDetach()V

    .line 96
    :try_start_0
    sget-object v0, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/SettingsListFragment;->receiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v0, v1}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 100
    :goto_0
    return-void

    .line 97
    :catch_0
    move-exception v0

    goto :goto_0
.end method

.method public showUpdatePhotoDlg(Z)V
    .locals 6
    .param p1, "havePhotos"    # Z

    .prologue
    const/4 v5, 0x1

    .line 177
    new-instance v2, Landroid/content/Intent;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/SettingsListFragment;->getActivity()Landroid/app/Activity;

    move-result-object v3

    const-class v4, Lcom/vkontakte/android/ImagePickerActivity;

    invoke-direct {v2, v3, v4}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string/jumbo v3, "allow_album"

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    move-result-object v2

    const-string/jumbo v3, "limit"

    invoke-virtual {v2, v3, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    move-result-object v1

    .line 178
    .local v1, "intent":Landroid/content/Intent;
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 179
    .local v0, "acts":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    if-eqz p1, :cond_0

    .line 180
    const v2, 0x7f08019c

    invoke-virtual {p0, v2}, Lcom/vkontakte/android/fragments/SettingsListFragment;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 181
    const-string/jumbo v2, "custom"

    invoke-virtual {v1, v2, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/io/Serializable;)Landroid/content/Intent;

    .line 183
    :cond_0
    const-string/jumbo v2, "no_thumbs"

    invoke-virtual {v1, v2, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    move-result-object v2

    const-string/jumbo v3, "force_thumb"

    invoke-virtual {v2, v3, v5}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 184
    const/16 v2, 0xf3d

    invoke-virtual {p0, v1, v2}, Lcom/vkontakte/android/fragments/SettingsListFragment;->startActivityForResult(Landroid/content/Intent;I)V

    .line 185
    return-void
.end method
