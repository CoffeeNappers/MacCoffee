.class public Lcom/vkontakte/android/sdk/SDKInviteActivity;
.super Lcom/vkontakte/android/VKActivity;
.source "SDKInviteActivity.java"

# interfaces
.implements Lcom/vkontakte/android/sdk/SDKInviteDialog$Listener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/sdk/SDKInviteActivity$Extra;
    }
.end annotation


# static fields
.field static final REQUEST_AUTH:I = 0x64

.field static final REQUEST_PICK_FRIEND:I = 0x2a


# instance fields
.field private mAppId:I

.field private mIds:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field private mInviteSent:Z

.field private mLink:Ljava/lang/CharSequence;

.field private mMessage:Ljava/lang/CharSequence;

.field private mPhoto:Ljava/lang/CharSequence;

.field private mSelectedProfile:Lcom/vkontakte/android/UserProfile;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 22
    invoke-direct {p0}, Lcom/vkontakte/android/VKActivity;-><init>()V

    .line 39
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vkontakte/android/sdk/SDKInviteActivity;->mInviteSent:Z

    return-void
.end method

.method static synthetic access$000(Lcom/vkontakte/android/sdk/SDKInviteActivity;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/sdk/SDKInviteActivity;

    .prologue
    .line 22
    invoke-direct {p0}, Lcom/vkontakte/android/sdk/SDKInviteActivity;->showInviteDialog()V

    return-void
.end method

.method static synthetic access$102(Lcom/vkontakte/android/sdk/SDKInviteActivity;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/sdk/SDKInviteActivity;
    .param p1, "x1"    # Z

    .prologue
    .line 22
    iput-boolean p1, p0, Lcom/vkontakte/android/sdk/SDKInviteActivity;->mInviteSent:Z

    return p1
.end method

.method static synthetic access$200(Lcom/vkontakte/android/sdk/SDKInviteActivity;II)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/sdk/SDKInviteActivity;
    .param p1, "x1"    # I
    .param p2, "x2"    # I

    .prologue
    .line 22
    invoke-direct {p0, p1, p2}, Lcom/vkontakte/android/sdk/SDKInviteActivity;->showExitDialog(II)V

    return-void
.end method

.method static synthetic access$300(Lcom/vkontakte/android/sdk/SDKInviteActivity;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/sdk/SDKInviteActivity;

    .prologue
    .line 22
    invoke-direct {p0}, Lcom/vkontakte/android/sdk/SDKInviteActivity;->showResendDialog()V

    return-void
.end method

.method private sendInvite(Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;)V
    .locals 5
    .param p1, "text"    # Ljava/lang/CharSequence;
    .param p2, "photo"    # Ljava/lang/CharSequence;
    .param p3, "link"    # Ljava/lang/CharSequence;

    .prologue
    .line 238
    iget-object v1, p0, Lcom/vkontakte/android/sdk/SDKInviteActivity;->mSelectedProfile:Lcom/vkontakte/android/UserProfile;

    iget v0, v1, Lcom/vkontakte/android/UserProfile;->uid:I

    .line 240
    .local v0, "uid":I
    new-instance v1, Lcom/vkontakte/android/api/apps/SDKAppSendRequest;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const/16 v3, 0xa

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-interface {p3}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-interface {p2}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v3

    iget v4, p0, Lcom/vkontakte/android/sdk/SDKInviteActivity;->mAppId:I

    invoke-direct {v1, v0, v2, v3, v4}, Lcom/vkontakte/android/api/apps/SDKAppSendRequest;-><init>(ILjava/lang/String;Ljava/lang/String;I)V

    new-instance v2, Lcom/vkontakte/android/sdk/SDKInviteActivity$3;

    invoke-direct {v2, p0, v0}, Lcom/vkontakte/android/sdk/SDKInviteActivity$3;-><init>(Lcom/vkontakte/android/sdk/SDKInviteActivity;I)V

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/api/apps/SDKAppSendRequest;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v1

    .line 252
    invoke-virtual {v1, p0}, Lcom/vkontakte/android/api/VKAPIRequest;->wrapProgress(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v1

    invoke-virtual {v1, p0}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 253
    return-void
.end method

.method private showExitDialog(II)V
    .locals 3
    .param p1, "mid"    # I
    .param p2, "uid"    # I

    .prologue
    .line 215
    new-instance v0, Lcom/vkontakte/android/sdk/SDKInviteActivity$2;

    invoke-direct {v0, p0, p1, p2}, Lcom/vkontakte/android/sdk/SDKInviteActivity$2;-><init>(Lcom/vkontakte/android/sdk/SDKInviteActivity;II)V

    .line 230
    .local v0, "l":Landroid/content/DialogInterface$OnClickListener;
    new-instance v1, Landroid/app/AlertDialog$Builder;

    invoke-direct {v1, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v2, 0x7f0805e3

    .line 231
    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const v2, 0x7f0805e0

    .line 232
    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const v2, 0x7f0805e1

    .line 233
    invoke-virtual {v1, v2, v0}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 234
    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 235
    return-void
.end method

.method private showInviteDialog()V
    .locals 4

    .prologue
    .line 124
    iget-object v1, p0, Lcom/vkontakte/android/sdk/SDKInviteActivity;->mMessage:Ljava/lang/CharSequence;

    iget-object v2, p0, Lcom/vkontakte/android/sdk/SDKInviteActivity;->mLink:Ljava/lang/CharSequence;

    iget-object v3, p0, Lcom/vkontakte/android/sdk/SDKInviteActivity;->mPhoto:Ljava/lang/CharSequence;

    invoke-static {v1, v2, v3}, Lcom/vkontakte/android/sdk/SDKInviteDialog;->newInstance(Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Lcom/vkontakte/android/sdk/SDKInviteDialog;

    move-result-object v0

    .line 125
    .local v0, "dialog":Lcom/vkontakte/android/sdk/SDKInviteDialog;
    invoke-virtual {p0}, Lcom/vkontakte/android/sdk/SDKInviteActivity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/vkontakte/android/sdk/SDKInviteDialog;->show(Landroid/app/FragmentManager;Ljava/lang/String;)V

    .line 193
    return-void
.end method

.method private showResendDialog()V
    .locals 3

    .prologue
    .line 196
    new-instance v0, Lcom/vkontakte/android/sdk/SDKInviteActivity$1;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/sdk/SDKInviteActivity$1;-><init>(Lcom/vkontakte/android/sdk/SDKInviteActivity;)V

    .line 206
    .local v0, "l":Landroid/content/DialogInterface$OnClickListener;
    new-instance v1, Landroid/app/AlertDialog$Builder;

    invoke-direct {v1, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v2, 0x7f0801f9

    .line 207
    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const v2, 0x7f0805df

    .line 208
    invoke-virtual {v1, v2}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const v2, 0x7f080479

    .line 209
    invoke-virtual {v1, v2, v0}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    const v2, 0x7f08011f

    .line 210
    invoke-virtual {v1, v2, v0}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v1

    .line 211
    invoke-virtual {v1}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 212
    return-void
.end method

.method private startChatFragment(Lcom/vkontakte/android/UserProfile;)V
    .locals 4
    .param p1, "profile"    # Lcom/vkontakte/android/UserProfile;

    .prologue
    .line 107
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 108
    .local v0, "args":Landroid/os/Bundle;
    const-string/jumbo v2, "id"

    iget v3, p1, Lcom/vkontakte/android/UserProfile;->uid:I

    invoke-virtual {v0, v2, v3}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 109
    const-string/jumbo v2, "title"

    iget-object v3, p1, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    invoke-virtual {v0, v2, v3}, Landroid/os/Bundle;->putCharSequence(Ljava/lang/String;Ljava/lang/CharSequence;)V

    .line 110
    iget v2, p1, Lcom/vkontakte/android/UserProfile;->uid:I

    const v3, 0x77359400

    if-ge v2, v3, :cond_0

    .line 111
    const-string/jumbo v2, "photo"

    iget-object v3, p1, Lcom/vkontakte/android/UserProfile;->photo:Ljava/lang/String;

    invoke-virtual {v0, v2, v3}, Landroid/os/Bundle;->putCharSequence(Ljava/lang/String;Ljava/lang/CharSequence;)V

    .line 114
    :cond_0
    new-instance v1, Lcom/vkontakte/android/fragments/messages/ChatFragment;

    invoke-direct {v1}, Lcom/vkontakte/android/fragments/messages/ChatFragment;-><init>()V

    .line 115
    .local v1, "chatFragment":Lcom/vkontakte/android/fragments/messages/ChatFragment;
    invoke-virtual {v1, v0}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->setArguments(Landroid/os/Bundle;)V

    .line 116
    invoke-virtual {p0}, Lcom/vkontakte/android/sdk/SDKInviteActivity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/FragmentManager;->beginTransaction()Landroid/app/FragmentTransaction;

    move-result-object v2

    const v3, 0x1020002

    invoke-virtual {v2, v3, v1}, Landroid/app/FragmentTransaction;->replace(ILandroid/app/Fragment;)Landroid/app/FragmentTransaction;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/FragmentTransaction;->commit()I

    .line 118
    iget-boolean v2, p0, Lcom/vkontakte/android/sdk/SDKInviteActivity;->mInviteSent:Z

    if-nez v2, :cond_1

    .line 119
    invoke-direct {p0}, Lcom/vkontakte/android/sdk/SDKInviteActivity;->showInviteDialog()V

    .line 121
    :cond_1
    return-void
.end method

.method private startFriendPickFragment(Ljava/util/ArrayList;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 95
    .local p1, "ids":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 96
    .local v0, "args":Landroid/os/Bundle;
    const-string/jumbo v2, "select"

    const/4 v3, 0x1

    invoke-virtual {v0, v2, v3}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 97
    const-string/jumbo v2, "title"

    const v3, 0x7f0805de

    invoke-virtual {p0, v3}, Lcom/vkontakte/android/sdk/SDKInviteActivity;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 98
    const-string/jumbo v2, "global_search"

    const/4 v3, 0x0

    invoke-virtual {v0, v2, v3}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 99
    const-string/jumbo v2, "uid"

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v3

    invoke-virtual {v3}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v3

    invoke-virtual {v0, v2, v3}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 100
    const-string/jumbo v2, "com.vkontakte.android.sdk.extra_ids"

    invoke-virtual {v0, v2, p1}, Landroid/os/Bundle;->putIntegerArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 101
    new-instance v1, Landroid/content/Intent;

    const-class v2, Lcom/vkontakte/android/sdk/SDKFriendPickerActivity;

    invoke-direct {v1, p0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 102
    .local v1, "intent":Landroid/content/Intent;
    const-string/jumbo v2, "args"

    invoke-virtual {v1, v2, v0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Bundle;)Landroid/content/Intent;

    .line 103
    const/16 v2, 0x2a

    invoke-virtual {p0, v1, v2}, Lcom/vkontakte/android/sdk/SDKInviteActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 104
    return-void
.end method


# virtual methods
.method protected onActivityResult(IILandroid/content/Intent;)V
    .locals 2
    .param p1, "requestCode"    # I
    .param p2, "resultCode"    # I
    .param p3, "data"    # Landroid/content/Intent;

    .prologue
    const/4 v1, -0x1

    .line 75
    invoke-super {p0, p1, p2, p3}, Lcom/vkontakte/android/VKActivity;->onActivityResult(IILandroid/content/Intent;)V

    .line 76
    const/16 v0, 0x2a

    if-ne p1, v0, :cond_2

    .line 77
    if-ne p2, v1, :cond_1

    .line 78
    const-string/jumbo v0, "user"

    invoke-virtual {p3, v0}, Landroid/content/Intent;->getParcelableExtra(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/UserProfile;

    iput-object v0, p0, Lcom/vkontakte/android/sdk/SDKInviteActivity;->mSelectedProfile:Lcom/vkontakte/android/UserProfile;

    .line 79
    iget-object v0, p0, Lcom/vkontakte/android/sdk/SDKInviteActivity;->mSelectedProfile:Lcom/vkontakte/android/UserProfile;

    invoke-direct {p0, v0}, Lcom/vkontakte/android/sdk/SDKInviteActivity;->startChatFragment(Lcom/vkontakte/android/UserProfile;)V

    .line 92
    :cond_0
    :goto_0
    return-void

    .line 81
    :cond_1
    invoke-virtual {p0}, Lcom/vkontakte/android/sdk/SDKInviteActivity;->finish()V

    goto :goto_0

    .line 83
    :cond_2
    const/16 v0, 0x64

    if-ne p1, v0, :cond_0

    .line 84
    if-ne p2, v1, :cond_3

    .line 85
    iget-object v0, p0, Lcom/vkontakte/android/sdk/SDKInviteActivity;->mIds:Ljava/util/ArrayList;

    invoke-direct {p0, v0}, Lcom/vkontakte/android/sdk/SDKInviteActivity;->startFriendPickFragment(Ljava/util/ArrayList;)V

    goto :goto_0

    .line 87
    :cond_3
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/sdk/SDKInviteActivity;->setResult(I)V

    .line 88
    invoke-virtual {p0}, Lcom/vkontakte/android/sdk/SDKInviteActivity;->finish()V

    goto :goto_0
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 3
    .param p1, "b"    # Landroid/os/Bundle;

    .prologue
    const/4 v2, 0x0

    .line 49
    invoke-super {p0, p1}, Lcom/vkontakte/android/VKActivity;->onCreate(Landroid/os/Bundle;)V

    .line 50
    invoke-virtual {p0}, Lcom/vkontakte/android/sdk/SDKInviteActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string/jumbo v1, "com.vkontakte.android.sdk.extra_ids"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getIntegerArrayListExtra(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/sdk/SDKInviteActivity;->mIds:Ljava/util/ArrayList;

    .line 51
    invoke-virtual {p0}, Lcom/vkontakte/android/sdk/SDKInviteActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string/jumbo v1, "com.vkontakte.android.sdk.extra_message"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getCharSequenceExtra(Ljava/lang/String;)Ljava/lang/CharSequence;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/sdk/SDKInviteActivity;->mMessage:Ljava/lang/CharSequence;

    .line 52
    invoke-virtual {p0}, Lcom/vkontakte/android/sdk/SDKInviteActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string/jumbo v1, "com.vkontakte.android.sdk.extra_photo"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getCharSequenceExtra(Ljava/lang/String;)Ljava/lang/CharSequence;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/sdk/SDKInviteActivity;->mPhoto:Ljava/lang/CharSequence;

    .line 53
    invoke-virtual {p0}, Lcom/vkontakte/android/sdk/SDKInviteActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string/jumbo v1, "com.vkontakte.android.sdk.extra_link"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->getCharSequenceExtra(Ljava/lang/String;)Ljava/lang/CharSequence;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/sdk/SDKInviteActivity;->mLink:Ljava/lang/CharSequence;

    .line 54
    invoke-virtual {p0}, Lcom/vkontakte/android/sdk/SDKInviteActivity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string/jumbo v1, "com.vkontakte.android.sdk.extra_app_id"

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    iput v0, p0, Lcom/vkontakte/android/sdk/SDKInviteActivity;->mAppId:I

    .line 56
    iget-object v0, p0, Lcom/vkontakte/android/sdk/SDKInviteActivity;->mIds:Ljava/util/ArrayList;

    if-nez v0, :cond_0

    .line 57
    invoke-virtual {p0, v2}, Lcom/vkontakte/android/sdk/SDKInviteActivity;->setResult(I)V

    .line 58
    invoke-virtual {p0}, Lcom/vkontakte/android/sdk/SDKInviteActivity;->finish()V

    .line 71
    :goto_0
    return-void

    .line 62
    :cond_0
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vkontakte/android/auth/VKAccount;->isReal()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 63
    iget-object v0, p0, Lcom/vkontakte/android/sdk/SDKInviteActivity;->mSelectedProfile:Lcom/vkontakte/android/UserProfile;

    if-nez v0, :cond_1

    .line 64
    iget-object v0, p0, Lcom/vkontakte/android/sdk/SDKInviteActivity;->mIds:Ljava/util/ArrayList;

    invoke-direct {p0, v0}, Lcom/vkontakte/android/sdk/SDKInviteActivity;->startFriendPickFragment(Ljava/util/ArrayList;)V

    goto :goto_0

    .line 66
    :cond_1
    iget-object v0, p0, Lcom/vkontakte/android/sdk/SDKInviteActivity;->mSelectedProfile:Lcom/vkontakte/android/UserProfile;

    invoke-direct {p0, v0}, Lcom/vkontakte/android/sdk/SDKInviteActivity;->startChatFragment(Lcom/vkontakte/android/UserProfile;)V

    goto :goto_0

    .line 69
    :cond_2
    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/vkontakte/android/AuthActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const/16 v1, 0x64

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/sdk/SDKInviteActivity;->startActivityForResult(Landroid/content/Intent;I)V

    goto :goto_0
.end method

.method public onInviteCanceled()V
    .locals 1

    .prologue
    .line 263
    iget-object v0, p0, Lcom/vkontakte/android/sdk/SDKInviteActivity;->mIds:Ljava/util/ArrayList;

    invoke-direct {p0, v0}, Lcom/vkontakte/android/sdk/SDKInviteActivity;->startFriendPickFragment(Ljava/util/ArrayList;)V

    .line 264
    return-void
.end method

.method public onInviteSent(Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;)V
    .locals 0
    .param p1, "message"    # Ljava/lang/CharSequence;
    .param p2, "photoAttachment"    # Ljava/lang/CharSequence;
    .param p3, "link"    # Ljava/lang/CharSequence;

    .prologue
    .line 258
    invoke-direct {p0, p1, p2, p3}, Lcom/vkontakte/android/sdk/SDKInviteActivity;->sendInvite(Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;)V

    .line 259
    return-void
.end method
