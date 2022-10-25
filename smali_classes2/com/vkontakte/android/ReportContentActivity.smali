.class public Lcom/vkontakte/android/ReportContentActivity;
.super Landroid/app/Activity;
.source "ReportContentActivity.java"


# static fields
.field public static final EXTRA_AD_ATTACHMENT:Ljava/lang/String; = "adAttachment"

.field public static final EXTRA_AD_NEWS_ENTRY:Ljava/lang/String; = "newsEntry"

.field private static final SPA_REQUEST_CODE:I = 0x4d2

.field private static final typeMap:[I


# instance fields
.field adAttachment:Lcom/vkontakte/android/attachments/ShitAttachment;

.field private logoutReceiver:Lcom/vkontakte/android/activities/LogoutReceiver;

.field newsEntry:Lcom/vkontakte/android/NewsEntry;

.field private reportAd:Z


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 34
    const/4 v0, 0x7

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    sput-object v0, Lcom/vkontakte/android/ReportContentActivity;->typeMap:[I

    return-void

    nop

    :array_0
    .array-data 4
        0x0
        0x6
        0x5
        0x4
        0x1
        0x2
        0x8
    .end array-data
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 25
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 32
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vkontakte/android/ReportContentActivity;->logoutReceiver:Lcom/vkontakte/android/activities/LogoutReceiver;

    .line 39
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vkontakte/android/ReportContentActivity;->reportAd:Z

    return-void
.end method

.method static synthetic access$000(Lcom/vkontakte/android/ReportContentActivity;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/ReportContentActivity;

    .prologue
    .line 25
    invoke-direct {p0}, Lcom/vkontakte/android/ReportContentActivity;->doHideAd()V

    return-void
.end method

.method private doHideAd()V
    .locals 5

    .prologue
    .line 124
    iget-object v1, p0, Lcom/vkontakte/android/ReportContentActivity;->newsEntry:Lcom/vkontakte/android/NewsEntry;

    iget-object v1, v1, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v2, 0x1

    if-ne v1, v2, :cond_0

    .line 125
    sget-object v1, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    new-instance v2, Landroid/content/Intent;

    const-string/jumbo v3, "com.vkontakte.android.POST_DELETED"

    invoke-direct {v2, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string/jumbo v3, "post_id"

    iget-object v4, p0, Lcom/vkontakte/android/ReportContentActivity;->newsEntry:Lcom/vkontakte/android/NewsEntry;

    iget v4, v4, Lcom/vkontakte/android/NewsEntry;->postID:I

    .line 127
    invoke-virtual {v2, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    move-result-object v2

    const-string/jumbo v3, "owner_id"

    iget-object v4, p0, Lcom/vkontakte/android/ReportContentActivity;->newsEntry:Lcom/vkontakte/android/NewsEntry;

    iget v4, v4, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    .line 128
    invoke-virtual {v2, v3, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    move-result-object v2

    const-string/jumbo v3, "com.vkontakte.android.permission.ACCESS_DATA"

    .line 125
    invoke-virtual {v1, v2, v3}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;Ljava/lang/String;)V

    .line 140
    :goto_0
    return-void

    .line 132
    :cond_0
    new-instance v0, Lcom/vkontakte/android/NewsEntry;

    iget-object v1, p0, Lcom/vkontakte/android/ReportContentActivity;->newsEntry:Lcom/vkontakte/android/NewsEntry;

    invoke-direct {v0, v1}, Lcom/vkontakte/android/NewsEntry;-><init>(Lcom/vkontakte/android/NewsEntry;)V

    .line 133
    .local v0, "newPost":Lcom/vkontakte/android/NewsEntry;
    iget-object v1, v0, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    iget-object v2, p0, Lcom/vkontakte/android/ReportContentActivity;->adAttachment:Lcom/vkontakte/android/attachments/ShitAttachment;

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 135
    sget-object v1, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    new-instance v2, Landroid/content/Intent;

    const-string/jumbo v3, "com.vkontakte.android.POST_REPLACED"

    invoke-direct {v2, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    const-string/jumbo v3, "entry"

    .line 136
    invoke-virtual {v2, v3, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Parcelable;)Landroid/content/Intent;

    move-result-object v2

    const-string/jumbo v3, "com.vkontakte.android.permission.ACCESS_DATA"

    .line 135
    invoke-virtual {v1, v2, v3}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;Ljava/lang/String;)V

    goto :goto_0
.end method

.method private mapTypeForSPA(Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .param p1, "type"    # Ljava/lang/String;

    .prologue
    .line 96
    const-string/jumbo v0, "post"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 97
    const-string/jumbo p1, "wall"

    .line 102
    .end local p1    # "type":Ljava/lang/String;
    :cond_0
    :goto_0
    return-object p1

    .line 99
    .restart local p1    # "type":Ljava/lang/String;
    :cond_1
    const-string/jumbo v0, "post_comment"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 100
    const-string/jumbo p1, "wall_comment"

    goto :goto_0
.end method

.method private sendReport(I)V
    .locals 8
    .param p1, "type"    # I

    .prologue
    const/4 v4, 0x0

    .line 149
    invoke-virtual {p0}, Lcom/vkontakte/android/ReportContentActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string/jumbo v1, "postInteract"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 150
    invoke-virtual {p0}, Lcom/vkontakte/android/ReportContentActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string/jumbo v1, "postInteract"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v7

    check-cast v7, Lcom/vkontakte/android/data/PostInteract;

    .line 151
    .local v7, "postInteract":Lcom/vkontakte/android/data/PostInteract;
    if-eqz v7, :cond_0

    .line 152
    sget-object v0, Lcom/vkontakte/android/data/PostInteract$Type;->report:Lcom/vkontakte/android/data/PostInteract$Type;

    invoke-virtual {v7, v0}, Lcom/vkontakte/android/data/PostInteract;->commit(Lcom/vkontakte/android/data/PostInteract$Type;)V

    .line 155
    .end local v7    # "postInteract":Lcom/vkontakte/android/data/PostInteract;
    :cond_0
    new-instance v0, Lcom/vkontakte/android/api/execute/ContentReport;

    invoke-virtual {p0}, Lcom/vkontakte/android/ReportContentActivity;->getIntent()Landroid/content/Intent;

    move-result-object v1

    const-string/jumbo v2, "ownerID"

    invoke-virtual {v1, v2, v4}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v1

    .line 156
    invoke-virtual {p0}, Lcom/vkontakte/android/ReportContentActivity;->getIntent()Landroid/content/Intent;

    move-result-object v2

    const-string/jumbo v3, "itemID"

    invoke-virtual {v2, v3, v4}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v2

    .line 157
    invoke-virtual {p0}, Lcom/vkontakte/android/ReportContentActivity;->getIntent()Landroid/content/Intent;

    move-result-object v3

    const-string/jumbo v4, "type"

    invoke-virtual {v3, v4}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 158
    invoke-virtual {p0}, Lcom/vkontakte/android/ReportContentActivity;->getIntent()Landroid/content/Intent;

    move-result-object v4

    const-string/jumbo v5, "refer"

    invoke-virtual {v4, v5}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 160
    invoke-virtual {p0}, Lcom/vkontakte/android/ReportContentActivity;->getIntent()Landroid/content/Intent;

    move-result-object v5

    const-string/jumbo v6, "trackCode"

    invoke-virtual {v5, v6}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    move v5, p1

    invoke-direct/range {v0 .. v6}, Lcom/vkontakte/android/api/execute/ContentReport;-><init>(IILjava/lang/String;Ljava/lang/String;ILjava/lang/String;)V

    new-instance v1, Lcom/vkontakte/android/ReportContentActivity$2;

    invoke-direct {v1, p0, p0}, Lcom/vkontakte/android/ReportContentActivity$2;-><init>(Lcom/vkontakte/android/ReportContentActivity;Landroid/content/Context;)V

    .line 161
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/execute/ContentReport;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 175
    invoke-virtual {v0, p0}, Lcom/vkontakte/android/api/VKAPIRequest;->wrapProgress(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 176
    invoke-virtual {v0, p0}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 177
    return-void
.end method


# virtual methods
.method synthetic lambda$onCreate$0(Landroid/content/DialogInterface;I)V
    .locals 4
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 67
    new-instance v0, Lcom/vkontakte/android/api/adsint/AdsintReportAd;

    iget-object v1, p0, Lcom/vkontakte/android/ReportContentActivity;->adAttachment:Lcom/vkontakte/android/attachments/ShitAttachment;

    iget-object v1, v1, Lcom/vkontakte/android/attachments/ShitAttachment;->data:Ljava/lang/String;

    invoke-virtual {p0}, Lcom/vkontakte/android/ReportContentActivity;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0c003b

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getStringArray(I)[Ljava/lang/String;

    move-result-object v2

    aget-object v2, v2, p2

    invoke-direct {v0, v1, v2}, Lcom/vkontakte/android/api/adsint/AdsintReportAd;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    new-instance v1, Lcom/vkontakte/android/ReportContentActivity$1;

    invoke-direct {v1, p0, p0}, Lcom/vkontakte/android/ReportContentActivity$1;-><init>(Lcom/vkontakte/android/ReportContentActivity;Landroid/content/Context;)V

    .line 68
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/adsint/AdsintReportAd;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 80
    invoke-virtual {v0, p0}, Lcom/vkontakte/android/api/VKAPIRequest;->wrapProgress(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 67
    return-void
.end method

.method synthetic lambda$onCreate$1(Landroid/content/DialogInterface;)V
    .locals 0
    .param p1, "dialog"    # Landroid/content/DialogInterface;

    .prologue
    .line 82
    invoke-virtual {p0}, Lcom/vkontakte/android/ReportContentActivity;->finish()V

    return-void
.end method

.method synthetic lambda$onCreate$2(Landroid/content/DialogInterface;I)V
    .locals 1
    .param p1, "dialog"    # Landroid/content/DialogInterface;
    .param p2, "which"    # I

    .prologue
    .line 88
    sget-object v0, Lcom/vkontakte/android/ReportContentActivity;->typeMap:[I

    aget v0, v0, p2

    invoke-direct {p0, v0}, Lcom/vkontakte/android/ReportContentActivity;->sendReport(I)V

    return-void
.end method

.method synthetic lambda$onCreate$3(Landroid/content/DialogInterface;)V
    .locals 0
    .param p1, "dialog"    # Landroid/content/DialogInterface;

    .prologue
    .line 89
    invoke-virtual {p0}, Lcom/vkontakte/android/ReportContentActivity;->finish()V

    return-void
.end method

.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 1
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    .line 107
    invoke-super {p0, p1, p2, p3}, Landroid/app/Activity;->onActivityResult(IILandroid/content/Intent;)V

    .line 108
    const/16 v0, 0x4d2

    if-ne p2, v0, :cond_0

    .line 109
    const/4 v0, -0x1

    if-ne p2, v0, :cond_0

    .line 114
    iget-boolean v0, p0, Lcom/vkontakte/android/ReportContentActivity;->reportAd:Z

    if-eqz v0, :cond_0

    .line 115
    invoke-direct {p0}, Lcom/vkontakte/android/ReportContentActivity;->doHideAd()V

    .line 120
    :cond_0
    invoke-virtual {p0}, Lcom/vkontakte/android/ReportContentActivity;->finish()V

    .line 121
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 9
    .param p1, "b"    # Landroid/os/Bundle;

    .prologue
    const v8, 0x7f0805bd

    const/16 v7, 0x4d2

    const/4 v6, 0x0

    .line 42
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 43
    invoke-static {p0}, Lcom/vkontakte/android/activities/LogoutReceiver;->register(Landroid/app/Activity;)Lcom/vkontakte/android/activities/LogoutReceiver;

    move-result-object v4

    iput-object v4, p0, Lcom/vkontakte/android/ReportContentActivity;->logoutReceiver:Lcom/vkontakte/android/activities/LogoutReceiver;

    .line 45
    invoke-virtual {p0}, Lcom/vkontakte/android/ReportContentActivity;->getIntent()Landroid/content/Intent;

    move-result-object v4

    const-string/jumbo v5, "adAttachment"

    invoke-virtual {v4, v5}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 46
    invoke-virtual {p0}, Lcom/vkontakte/android/ReportContentActivity;->getIntent()Landroid/content/Intent;

    move-result-object v4

    const-string/jumbo v5, "adAttachment"

    invoke-virtual {v4, v5}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v4

    check-cast v4, Lcom/vkontakte/android/attachments/ShitAttachment;

    iput-object v4, p0, Lcom/vkontakte/android/ReportContentActivity;->adAttachment:Lcom/vkontakte/android/attachments/ShitAttachment;

    .line 47
    invoke-virtual {p0}, Lcom/vkontakte/android/ReportContentActivity;->getIntent()Landroid/content/Intent;

    move-result-object v4

    const-string/jumbo v5, "newsEntry"

    invoke-virtual {v4, v5}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v4

    check-cast v4, Lcom/vkontakte/android/NewsEntry;

    iput-object v4, p0, Lcom/vkontakte/android/ReportContentActivity;->newsEntry:Lcom/vkontakte/android/NewsEntry;

    .line 48
    const/4 v4, 0x1

    iput-boolean v4, p0, Lcom/vkontakte/android/ReportContentActivity;->reportAd:Z

    .line 50
    :cond_0
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v4

    iget-boolean v4, v4, Lcom/vkontakte/android/auth/VKAccount;->useWebAppForReportContent:Z

    if-eqz v4, :cond_2

    .line 51
    iget-boolean v4, p0, Lcom/vkontakte/android/ReportContentActivity;->reportAd:Z

    if-eqz v4, :cond_1

    .line 52
    new-instance v4, Lcom/vk/webapp/VKUIWebContainerFragment$Builder;

    iget-object v5, p0, Lcom/vkontakte/android/ReportContentActivity;->adAttachment:Lcom/vkontakte/android/attachments/ShitAttachment;

    iget-object v5, v5, Lcom/vkontakte/android/attachments/ShitAttachment;->data:Ljava/lang/String;

    const-string/jumbo v6, ""

    invoke-static {v5, v6}, Lcom/vk/webapp/ReportAppInputData;->getSPAUriForAd(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lcom/vk/webapp/VKUIWebContainerFragment$Builder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, p0, v7}, Lcom/vk/webapp/VKUIWebContainerFragment$Builder;->forResult(Landroid/app/Activity;I)Z

    .line 93
    :goto_0
    return-void

    .line 55
    :cond_1
    invoke-virtual {p0}, Lcom/vkontakte/android/ReportContentActivity;->getIntent()Landroid/content/Intent;

    move-result-object v4

    const-string/jumbo v5, "type"

    invoke-virtual {v4, v5}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 56
    .local v3, "type":Ljava/lang/String;
    invoke-direct {p0, v3}, Lcom/vkontakte/android/ReportContentActivity;->mapTypeForSPA(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 57
    invoke-virtual {p0}, Lcom/vkontakte/android/ReportContentActivity;->getIntent()Landroid/content/Intent;

    move-result-object v4

    const-string/jumbo v5, "ownerID"

    invoke-virtual {v4, v5, v6}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v1

    .line 58
    .local v1, "ownerId":I
    invoke-virtual {p0}, Lcom/vkontakte/android/ReportContentActivity;->getIntent()Landroid/content/Intent;

    move-result-object v4

    const-string/jumbo v5, "itemID"

    invoke-virtual {v4, v5, v6}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    .line 59
    .local v0, "itemId":I
    invoke-virtual {p0}, Lcom/vkontakte/android/ReportContentActivity;->getIntent()Landroid/content/Intent;

    move-result-object v4

    const-string/jumbo v5, "refer"

    invoke-virtual {v4, v5}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 61
    .local v2, "ref":Ljava/lang/String;
    new-instance v4, Lcom/vk/webapp/VKUIWebContainerFragment$Builder;

    invoke-static {v3, v1, v0, v2}, Lcom/vk/webapp/ReportAppInputData;->getSPAUriForMainContentTypes(Ljava/lang/String;IILjava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Lcom/vk/webapp/VKUIWebContainerFragment$Builder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, p0, v7}, Lcom/vk/webapp/VKUIWebContainerFragment$Builder;->forResult(Landroid/app/Activity;I)Z

    goto :goto_0

    .line 65
    .end local v0    # "itemId":I
    .end local v1    # "ownerId":I
    .end local v2    # "ref":Ljava/lang/String;
    .end local v3    # "type":Ljava/lang/String;
    :cond_2
    iget-boolean v4, p0, Lcom/vkontakte/android/ReportContentActivity;->reportAd:Z

    if-eqz v4, :cond_3

    .line 66
    new-instance v4, Lcom/vkontakte/android/VKAlertDialog$Builder;

    invoke-direct {v4, p0}, Lcom/vkontakte/android/VKAlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const/high16 v5, 0x7f0c0000

    invoke-static {p0}, Lcom/vkontakte/android/ReportContentActivity$$Lambda$1;->lambdaFactory$(Lcom/vkontakte/android/ReportContentActivity;)Landroid/content/DialogInterface$OnClickListener;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Lcom/vkontakte/android/VKAlertDialog$Builder;->setItems(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v4

    .line 81
    invoke-virtual {v4, v8}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v4

    invoke-static {p0}, Lcom/vkontakte/android/ReportContentActivity$$Lambda$2;->lambdaFactory$(Lcom/vkontakte/android/ReportContentActivity;)Landroid/content/DialogInterface$OnCancelListener;

    move-result-object v5

    .line 82
    invoke-virtual {v4, v5}, Landroid/app/AlertDialog$Builder;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v4

    .line 83
    invoke-virtual {v4}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    goto :goto_0

    .line 86
    :cond_3
    new-instance v4, Lcom/vkontakte/android/VKAlertDialog$Builder;

    invoke-direct {v4, p0}, Lcom/vkontakte/android/VKAlertDialog$Builder;-><init>(Landroid/content/Context;)V

    .line 87
    invoke-virtual {v4, v8}, Lcom/vkontakte/android/VKAlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v4

    const v5, 0x7f0c002e

    invoke-static {p0}, Lcom/vkontakte/android/ReportContentActivity$$Lambda$3;->lambdaFactory$(Lcom/vkontakte/android/ReportContentActivity;)Landroid/content/DialogInterface$OnClickListener;

    move-result-object v6

    .line 88
    invoke-virtual {v4, v5, v6}, Landroid/app/AlertDialog$Builder;->setItems(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v4

    invoke-static {p0}, Lcom/vkontakte/android/ReportContentActivity$$Lambda$4;->lambdaFactory$(Lcom/vkontakte/android/ReportContentActivity;)Landroid/content/DialogInterface$OnCancelListener;

    move-result-object v5

    .line 89
    invoke-virtual {v4, v5}, Landroid/app/AlertDialog$Builder;->setOnCancelListener(Landroid/content/DialogInterface$OnCancelListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v4

    .line 90
    invoke-virtual {v4}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    goto :goto_0
.end method

.method protected onDestroy()V
    .locals 1

    .prologue
    .line 144
    iget-object v0, p0, Lcom/vkontakte/android/ReportContentActivity;->logoutReceiver:Lcom/vkontakte/android/activities/LogoutReceiver;

    invoke-virtual {v0}, Lcom/vkontakte/android/activities/LogoutReceiver;->unregister()V

    .line 145
    invoke-super {p0}, Landroid/app/Activity;->onDestroy()V

    .line 146
    return-void
.end method
