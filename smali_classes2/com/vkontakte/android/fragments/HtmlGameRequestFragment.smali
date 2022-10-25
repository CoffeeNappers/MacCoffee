.class public Lcom/vkontakte/android/fragments/HtmlGameRequestFragment;
.super Lme/grishka/appkit/fragments/AppKitFragment;
.source "HtmlGameRequestFragment.java"


# static fields
.field private static final EXTRA_APPLICATION:Ljava/lang/String; = "application"

.field private static final EXTRA_MESSAGE:Ljava/lang/String; = "message"

.field private static final EXTRA_REQUEST_KEY:Ljava/lang/String; = "request_key"

.field private static final EXTRA_USER_TO:Ljava/lang/String; = "user_to"

.field public static final HTMLGAME_REQUEST_REQUEST_CODE:I = 0x1


# instance fields
.field private apiApplication:Lcom/vkontakte/android/data/ApiApplication;

.field private imageViewFrom:Lcom/vk/imageloader/view/VKImageView;

.field private imageViewGame:Lcom/vk/imageloader/view/VKImageView;

.field private message:Ljava/lang/String;

.field private requestKey:Ljava/lang/String;

.field private textViewFrom:Lcom/vkontakte/android/ui/TextView;

.field private textViewMessage:Lcom/vkontakte/android/ui/TextView;

.field private textViewNegative:Lcom/vkontakte/android/ui/TextView;

.field private textViewPositive:Lcom/vkontakte/android/ui/TextView;

.field private textViewTo:Lcom/vkontakte/android/ui/TextView;

.field private userTo:Lcom/vkontakte/android/UserProfile;


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 40
    invoke-direct {p0}, Lme/grishka/appkit/fragments/AppKitFragment;-><init>()V

    return-void
.end method

.method private bindData()V
    .locals 8

    .prologue
    const v6, 0x7f080313

    const/4 v7, 0x0

    .line 157
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/HtmlGameRequestFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3, v6}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    .line 158
    .local v2, "toUserFrm":Ljava/lang/String;
    new-instance v1, Landroid/text/SpannableString;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/HtmlGameRequestFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    iget-object v5, p0, Lcom/vkontakte/android/fragments/HtmlGameRequestFragment;->userTo:Lcom/vkontakte/android/UserProfile;

    iget-object v5, v5, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    aput-object v5, v4, v7

    invoke-virtual {v3, v6, v4}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v3}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    .line 159
    .local v1, "ss":Landroid/text/SpannableString;
    new-instance v3, Landroid/text/style/ForegroundColorSpan;

    const v4, -0xd1cfcd

    invoke-direct {v3, v4}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    const-string/jumbo v4, "%s"

    invoke-virtual {v2, v4}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v4

    const-string/jumbo v5, "%s"

    invoke-virtual {v2, v5}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v5

    invoke-virtual {v1}, Landroid/text/SpannableString;->length()I

    move-result v6

    add-int/2addr v5, v6

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v6

    sub-int/2addr v5, v6

    add-int/lit8 v5, v5, 0x2

    invoke-virtual {v1, v3, v4, v5, v7}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    .line 161
    iget-object v3, p0, Lcom/vkontakte/android/fragments/HtmlGameRequestFragment;->textViewTo:Lcom/vkontakte/android/ui/TextView;

    invoke-virtual {v3, v1}, Lcom/vkontakte/android/ui/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 163
    iget-object v3, p0, Lcom/vkontakte/android/fragments/HtmlGameRequestFragment;->imageViewFrom:Lcom/vk/imageloader/view/VKImageView;

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v4

    invoke-virtual {v4}, Lcom/vkontakte/android/auth/VKAccount;->getPhoto()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/vk/imageloader/view/VKImageView;->load(Ljava/lang/String;)V

    .line 164
    iget-object v3, p0, Lcom/vkontakte/android/fragments/HtmlGameRequestFragment;->textViewFrom:Lcom/vkontakte/android/ui/TextView;

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v4

    invoke-virtual {v4}, Lcom/vkontakte/android/auth/VKAccount;->getName()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/vkontakte/android/ui/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 165
    iget-object v3, p0, Lcom/vkontakte/android/fragments/HtmlGameRequestFragment;->textViewMessage:Lcom/vkontakte/android/ui/TextView;

    iget-object v4, p0, Lcom/vkontakte/android/fragments/HtmlGameRequestFragment;->message:Ljava/lang/String;

    invoke-virtual {v3, v4}, Lcom/vkontakte/android/ui/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 166
    iget-object v3, p0, Lcom/vkontakte/android/fragments/HtmlGameRequestFragment;->apiApplication:Lcom/vkontakte/android/data/ApiApplication;

    iget-object v3, v3, Lcom/vkontakte/android/data/ApiApplication;->icon:Lcom/vkontakte/android/Photo;

    if-eqz v3, :cond_0

    .line 167
    iget-object v3, p0, Lcom/vkontakte/android/fragments/HtmlGameRequestFragment;->apiApplication:Lcom/vkontakte/android/data/ApiApplication;

    iget-object v3, v3, Lcom/vkontakte/android/data/ApiApplication;->icon:Lcom/vkontakte/android/Photo;

    const/high16 v4, 0x42100000    # 36.0f

    invoke-static {v4}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v4

    invoke-virtual {v3, v4}, Lcom/vkontakte/android/Photo;->getImageByWidth(I)Lcom/vkontakte/android/Photo$Image;

    move-result-object v0

    .line 168
    .local v0, "im":Lcom/vkontakte/android/Photo$Image;
    if-eqz v0, :cond_0

    iget-object v3, v0, Lcom/vkontakte/android/Photo$Image;->url:Ljava/lang/String;

    if-eqz v3, :cond_0

    .line 169
    iget-object v3, p0, Lcom/vkontakte/android/fragments/HtmlGameRequestFragment;->imageViewGame:Lcom/vk/imageloader/view/VKImageView;

    iget-object v4, v0, Lcom/vkontakte/android/Photo$Image;->url:Ljava/lang/String;

    invoke-virtual {v3, v4}, Lcom/vk/imageloader/view/VKImageView;->load(Ljava/lang/String;)V

    .line 172
    .end local v0    # "im":Lcom/vkontakte/android/Photo$Image;
    :cond_0
    return-void
.end method

.method private cancel()V
    .locals 2

    .prologue
    .line 193
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/HtmlGameRequestFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/app/Activity;->setResult(I)V

    .line 194
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/HtmlGameRequestFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->finish()V

    .line 195
    return-void
.end method

.method private sendRequest()V
    .locals 4

    .prologue
    .line 176
    iget-object v0, p0, Lcom/vkontakte/android/fragments/HtmlGameRequestFragment;->apiApplication:Lcom/vkontakte/android/data/ApiApplication;

    iget v0, v0, Lcom/vkontakte/android/data/ApiApplication;->id:I

    iget-object v1, p0, Lcom/vkontakte/android/fragments/HtmlGameRequestFragment;->userTo:Lcom/vkontakte/android/UserProfile;

    iget v1, v1, Lcom/vkontakte/android/UserProfile;->uid:I

    iget-object v2, p0, Lcom/vkontakte/android/fragments/HtmlGameRequestFragment;->message:Ljava/lang/String;

    iget-object v3, p0, Lcom/vkontakte/android/fragments/HtmlGameRequestFragment;->requestKey:Ljava/lang/String;

    invoke-static {v0, v1, v2, v3}, Lcom/vkontakte/android/api/apps/AppsSendRequest;->createAppRequestRequest(IILjava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/apps/AppsSendRequest;

    move-result-object v0

    new-instance v1, Lcom/vkontakte/android/fragments/HtmlGameRequestFragment$2;

    invoke-direct {v1, p0, p0}, Lcom/vkontakte/android/fragments/HtmlGameRequestFragment$2;-><init>(Lcom/vkontakte/android/fragments/HtmlGameRequestFragment;Landroid/app/Fragment;)V

    .line 180
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/apps/AppsSendRequest;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 188
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/HtmlGameRequestFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->wrapProgress(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/HtmlGameRequestFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 190
    return-void
.end method

.method public static showForResult(IILjava/lang/String;Ljava/lang/String;Landroid/app/Fragment;)V
    .locals 2
    .param p0, "appId"    # I
    .param p1, "userId"    # I
    .param p2, "message"    # Ljava/lang/String;
    .param p3, "requestKey"    # Ljava/lang/String;
    .param p4, "fragment"    # Landroid/app/Fragment;

    .prologue
    .line 55
    new-instance v0, Lcom/vkontakte/android/api/apps/AppGetWithUser;

    invoke-direct {v0, p0, p1}, Lcom/vkontakte/android/api/apps/AppGetWithUser;-><init>(II)V

    new-instance v1, Lcom/vkontakte/android/fragments/HtmlGameRequestFragment$1;

    invoke-direct {v1, p4, p2, p3}, Lcom/vkontakte/android/fragments/HtmlGameRequestFragment$1;-><init>(Landroid/app/Fragment;Ljava/lang/String;Ljava/lang/String;)V

    .line 56
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/apps/AppGetWithUser;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 61
    invoke-virtual {p4}, Landroid/app/Fragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->wrapProgress(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    invoke-virtual {p4}, Landroid/app/Fragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 62
    return-void
.end method

.method public static showForResult(Lcom/vkontakte/android/data/ApiApplication;Lcom/vkontakte/android/UserProfile;Ljava/lang/String;Ljava/lang/String;Landroid/app/Fragment;)V
    .locals 5
    .param p0, "apiApplication"    # Lcom/vkontakte/android/data/ApiApplication;
    .param p1, "toUser"    # Lcom/vkontakte/android/UserProfile;
    .param p2, "message"    # Ljava/lang/String;
    .param p3, "requestKey"    # Ljava/lang/String;
    .param p4, "fragment"    # Landroid/app/Fragment;

    .prologue
    .line 71
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 72
    .local v0, "args":Landroid/os/Bundle;
    const-string/jumbo v1, "application"

    invoke-virtual {v0, v1, p0}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 73
    const-string/jumbo v1, "user_to"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 74
    const-string/jumbo v1, "message"

    invoke-virtual {v0, v1, p2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 75
    const-string/jumbo v1, "request_key"

    invoke-virtual {v0, v1, p3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 76
    new-instance v1, Lcom/vkontakte/android/navigation/Navigator;

    const-class v2, Lcom/vkontakte/android/fragments/HtmlGameRequestFragment;

    new-instance v3, Lcom/vkontakte/android/TabletDialogActivity$Builder;

    const-class v4, Lcom/vkontakte/android/FragmentDialogActivity;

    invoke-direct {v3, v4}, Lcom/vkontakte/android/TabletDialogActivity$Builder;-><init>(Ljava/lang/Class;)V

    const/high16 v4, 0x43b40000    # 360.0f

    .line 79
    invoke-static {v4}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v4

    invoke-virtual {v3, v4}, Lcom/vkontakte/android/TabletDialogActivity$Builder;->setMaxWidth(I)Lcom/vkontakte/android/TabletDialogActivity$Builder;

    move-result-object v3

    const/high16 v4, 0x42000000    # 32.0f

    .line 80
    invoke-static {v4}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v4

    invoke-virtual {v3, v4}, Lcom/vkontakte/android/TabletDialogActivity$Builder;->setMinSpacing(I)Lcom/vkontakte/android/TabletDialogActivity$Builder;

    move-result-object v3

    const/16 v4, 0x11

    .line 81
    invoke-virtual {v3, v4}, Lcom/vkontakte/android/TabletDialogActivity$Builder;->setGravity(I)Lcom/vkontakte/android/TabletDialogActivity$Builder;

    move-result-object v3

    const v4, 0x7f0b0192

    .line 82
    invoke-virtual {v3, v4}, Lcom/vkontakte/android/TabletDialogActivity$Builder;->windowAnimationResource(I)Lcom/vkontakte/android/TabletDialogActivity$Builder;

    move-result-object v3

    const v4, 0x106000b

    .line 83
    invoke-virtual {v3, v4}, Lcom/vkontakte/android/TabletDialogActivity$Builder;->windowBackgroundResource(I)Lcom/vkontakte/android/TabletDialogActivity$Builder;

    move-result-object v3

    invoke-direct {v1, v2, v3, v0}, Lcom/vkontakte/android/navigation/Navigator;-><init>(Ljava/lang/Class;Lcom/vkontakte/android/navigation/Navigator$ActivityNavigator;Landroid/os/Bundle;)V

    const/4 v2, 0x1

    .line 84
    invoke-virtual {v1, p4, v2}, Lcom/vkontakte/android/navigation/Navigator;->forResult(Landroid/app/Fragment;I)Z

    .line 85
    return-void
.end method


# virtual methods
.method synthetic lambda$onViewCreated$0(Landroid/view/View;)V
    .locals 0
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 139
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/HtmlGameRequestFragment;->sendRequest()V

    return-void
.end method

.method synthetic lambda$onViewCreated$1(Landroid/view/View;)V
    .locals 0
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 140
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/HtmlGameRequestFragment;->cancel()V

    return-void
.end method

.method public onActivityCreated(Landroid/os/Bundle;)V
    .locals 0
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 117
    invoke-super {p0, p1}, Lme/grishka/appkit/fragments/AppKitFragment;->onActivityCreated(Landroid/os/Bundle;)V

    .line 118
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/HtmlGameRequestFragment;->bindData()V

    .line 119
    return-void
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 2
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 108
    invoke-super {p0, p1}, Lme/grishka/appkit/fragments/AppKitFragment;->onCreate(Landroid/os/Bundle;)V

    .line 109
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/HtmlGameRequestFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v1, "application"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/data/ApiApplication;

    iput-object v0, p0, Lcom/vkontakte/android/fragments/HtmlGameRequestFragment;->apiApplication:Lcom/vkontakte/android/data/ApiApplication;

    .line 110
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/HtmlGameRequestFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v1, "user_to"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/UserProfile;

    iput-object v0, p0, Lcom/vkontakte/android/fragments/HtmlGameRequestFragment;->userTo:Lcom/vkontakte/android/UserProfile;

    .line 111
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/HtmlGameRequestFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v1, "message"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/fragments/HtmlGameRequestFragment;->message:Ljava/lang/String;

    .line 112
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/HtmlGameRequestFragment;->getArguments()Landroid/os/Bundle;

    move-result-object v0

    const-string/jumbo v1, "request_key"

    invoke-virtual {v0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/fragments/HtmlGameRequestFragment;->requestKey:Ljava/lang/String;

    .line 113
    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 2
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 124
    const v0, 0x7f0300d7

    const/4 v1, 0x0

    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method public onDestroyView()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 145
    invoke-super {p0}, Lme/grishka/appkit/fragments/AppKitFragment;->onDestroyView()V

    .line 146
    iput-object v0, p0, Lcom/vkontakte/android/fragments/HtmlGameRequestFragment;->textViewTo:Lcom/vkontakte/android/ui/TextView;

    .line 147
    iput-object v0, p0, Lcom/vkontakte/android/fragments/HtmlGameRequestFragment;->imageViewFrom:Lcom/vk/imageloader/view/VKImageView;

    .line 148
    iput-object v0, p0, Lcom/vkontakte/android/fragments/HtmlGameRequestFragment;->textViewFrom:Lcom/vkontakte/android/ui/TextView;

    .line 149
    iput-object v0, p0, Lcom/vkontakte/android/fragments/HtmlGameRequestFragment;->textViewMessage:Lcom/vkontakte/android/ui/TextView;

    .line 150
    iput-object v0, p0, Lcom/vkontakte/android/fragments/HtmlGameRequestFragment;->imageViewGame:Lcom/vk/imageloader/view/VKImageView;

    .line 151
    iput-object v0, p0, Lcom/vkontakte/android/fragments/HtmlGameRequestFragment;->textViewPositive:Lcom/vkontakte/android/ui/TextView;

    .line 152
    iput-object v0, p0, Lcom/vkontakte/android/fragments/HtmlGameRequestFragment;->textViewNegative:Lcom/vkontakte/android/ui/TextView;

    .line 153
    return-void
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 2
    .param p1, "view"    # Landroid/view/View;
    .param p2, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 129
    invoke-super {p0, p1, p2}, Lme/grishka/appkit/fragments/AppKitFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    .line 131
    const v0, 0x7f10032a

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/ui/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/fragments/HtmlGameRequestFragment;->textViewTo:Lcom/vkontakte/android/ui/TextView;

    .line 132
    const v0, 0x7f1001e8

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/vk/imageloader/view/VKImageView;

    iput-object v0, p0, Lcom/vkontakte/android/fragments/HtmlGameRequestFragment;->imageViewFrom:Lcom/vk/imageloader/view/VKImageView;

    .line 133
    const v0, 0x7f10032c

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/ui/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/fragments/HtmlGameRequestFragment;->textViewFrom:Lcom/vkontakte/android/ui/TextView;

    .line 134
    const v0, 0x7f10032d

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/ui/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/fragments/HtmlGameRequestFragment;->textViewMessage:Lcom/vkontakte/android/ui/TextView;

    .line 135
    const v0, 0x7f10032b

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/vk/imageloader/view/VKImageView;

    iput-object v0, p0, Lcom/vkontakte/android/fragments/HtmlGameRequestFragment;->imageViewGame:Lcom/vk/imageloader/view/VKImageView;

    .line 136
    const v0, 0x7f1002b3

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/ui/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/fragments/HtmlGameRequestFragment;->textViewPositive:Lcom/vkontakte/android/ui/TextView;

    .line 137
    const v0, 0x7f1002b4

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/ui/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/fragments/HtmlGameRequestFragment;->textViewNegative:Lcom/vkontakte/android/ui/TextView;

    .line 139
    iget-object v0, p0, Lcom/vkontakte/android/fragments/HtmlGameRequestFragment;->textViewPositive:Lcom/vkontakte/android/ui/TextView;

    invoke-static {p0}, Lcom/vkontakte/android/fragments/HtmlGameRequestFragment$$Lambda$1;->lambdaFactory$(Lcom/vkontakte/android/fragments/HtmlGameRequestFragment;)Landroid/view/View$OnClickListener;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/ui/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 140
    iget-object v0, p0, Lcom/vkontakte/android/fragments/HtmlGameRequestFragment;->textViewNegative:Lcom/vkontakte/android/ui/TextView;

    invoke-static {p0}, Lcom/vkontakte/android/fragments/HtmlGameRequestFragment$$Lambda$2;->lambdaFactory$(Lcom/vkontakte/android/fragments/HtmlGameRequestFragment;)Landroid/view/View$OnClickListener;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/ui/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 141
    return-void
.end method
