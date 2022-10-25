.class public Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionFragment;
.super Lme/grishka/appkit/fragments/AppKitFragment;
.source "BuyMusicSubscriptionFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Lcom/vkontakte/android/data/PurchasesManager$OnSuccessListener;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lme/grishka/appkit/fragments/AppKitFragment;",
        "Landroid/view/View$OnClickListener;",
        "Lcom/vkontakte/android/data/PurchasesManager$OnSuccessListener",
        "<",
        "Lcom/vkontakte/android/data/Subscription;",
        ">;"
    }
.end annotation


# static fields
.field private static final MUSIC_SUBSCRIPTION_ID:I = 0x1

.field private static showed:Z


# instance fields
.field private buttonPrice:Landroid/widget/TextView;

.field private buttonTitle:Landroid/widget/TextView;

.field private buyButton:Landroid/view/View;

.field private buyButtonDisable:Landroid/view/View;

.field private buyButtonDisableText:Landroid/widget/TextView;

.field private currentRequest:Lcom/vkontakte/android/api/store/GetSubscription;

.field private final helper:Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionHelper;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionHelper",
            "<",
            "Lcom/vkontakte/android/data/Subscription;",
            ">;"
        }
    .end annotation
.end field

.field private progressBar:Landroid/widget/ProgressBar;

.field private subscription:Lcom/vkontakte/android/data/Subscription;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 47
    const/4 v0, 0x0

    sput-boolean v0, Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionFragment;->showed:Z

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 42
    invoke-direct {p0}, Lme/grishka/appkit/fragments/AppKitFragment;-><init>()V

    .line 55
    iput-object v0, p0, Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionFragment;->currentRequest:Lcom/vkontakte/android/api/store/GetSubscription;

    .line 56
    iput-object v0, p0, Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionFragment;->subscription:Lcom/vkontakte/android/data/Subscription;

    .line 58
    new-instance v0, Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionHelper;

    invoke-direct {v0}, Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionHelper;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionFragment;->helper:Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionHelper;

    return-void
.end method

.method static synthetic access$002(Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionFragment;Lcom/vkontakte/android/data/Subscription;)Lcom/vkontakte/android/data/Subscription;
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionFragment;
    .param p1, "x1"    # Lcom/vkontakte/android/data/Subscription;

    .prologue
    .line 42
    iput-object p1, p0, Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionFragment;->subscription:Lcom/vkontakte/android/data/Subscription;

    return-object p1
.end method

.method static synthetic access$100(Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionFragment;Ljava/lang/String;Z)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionFragment;
    .param p1, "x1"    # Ljava/lang/String;
    .param p2, "x2"    # Z

    .prologue
    .line 42
    invoke-direct {p0, p1, p2}, Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionFragment;->showButtonInfo(Ljava/lang/String;Z)V

    return-void
.end method

.method static synthetic access$202(Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionFragment;Lcom/vkontakte/android/api/store/GetSubscription;)Lcom/vkontakte/android/api/store/GetSubscription;
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionFragment;
    .param p1, "x1"    # Lcom/vkontakte/android/api/store/GetSubscription;

    .prologue
    .line 42
    iput-object p1, p0, Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionFragment;->currentRequest:Lcom/vkontakte/android/api/store/GetSubscription;

    return-object p1
.end method

.method public static isShowed()Z
    .locals 1

    .prologue
    .line 73
    sget-boolean v0, Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionFragment;->showed:Z

    return v0
.end method

.method private loadStockItemInfo()V
    .locals 2

    .prologue
    .line 151
    iget-object v0, p0, Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionFragment;->currentRequest:Lcom/vkontakte/android/api/store/GetSubscription;

    if-nez v0, :cond_0

    .line 152
    new-instance v0, Lcom/vkontakte/android/api/store/GetSubscription;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lcom/vkontakte/android/api/store/GetSubscription;-><init>(I)V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionFragment;->currentRequest:Lcom/vkontakte/android/api/store/GetSubscription;

    .line 153
    iget-object v0, p0, Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionFragment;->currentRequest:Lcom/vkontakte/android/api/store/GetSubscription;

    new-instance v1, Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionFragment$1;

    invoke-direct {v1, p0}, Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionFragment$1;-><init>(Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionFragment;)V

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/store/GetSubscription;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 179
    iget-object v0, p0, Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionFragment;->currentRequest:Lcom/vkontakte/android/api/store/GetSubscription;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/store/GetSubscription;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 181
    :cond_0
    return-void
.end method

.method public static show(Landroid/content/Context;)V
    .locals 4
    .param p0, "ctx"    # Landroid/content/Context;

    .prologue
    .line 77
    new-instance v0, Lcom/vkontakte/android/navigation/Navigator;

    const-class v1, Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionFragment;

    new-instance v2, Lcom/vkontakte/android/TabletDialogActivity$Builder;

    const-class v3, Lcom/vkontakte/android/FragmentDialogActivity;

    invoke-direct {v2, v3}, Lcom/vkontakte/android/TabletDialogActivity$Builder;-><init>(Ljava/lang/Class;)V

    const/high16 v3, 0x439c0000    # 312.0f

    .line 78
    invoke-static {v3}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v3

    invoke-virtual {v2, v3}, Lcom/vkontakte/android/TabletDialogActivity$Builder;->setMaxWidth(I)Lcom/vkontakte/android/TabletDialogActivity$Builder;

    move-result-object v2

    const/high16 v3, 0x42000000    # 32.0f

    .line 79
    invoke-static {v3}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v3

    invoke-virtual {v2, v3}, Lcom/vkontakte/android/TabletDialogActivity$Builder;->setMinSpacing(I)Lcom/vkontakte/android/TabletDialogActivity$Builder;

    move-result-object v2

    const/16 v3, 0x11

    .line 80
    invoke-virtual {v2, v3}, Lcom/vkontakte/android/TabletDialogActivity$Builder;->setGravity(I)Lcom/vkontakte/android/TabletDialogActivity$Builder;

    move-result-object v2

    const v3, 0x7f0203db

    .line 81
    invoke-virtual {v2, v3}, Lcom/vkontakte/android/TabletDialogActivity$Builder;->windowBackgroundResource(I)Lcom/vkontakte/android/TabletDialogActivity$Builder;

    move-result-object v2

    new-instance v3, Landroid/os/Bundle;

    invoke-direct {v3}, Landroid/os/Bundle;-><init>()V

    invoke-direct {v0, v1, v2, v3}, Lcom/vkontakte/android/navigation/Navigator;-><init>(Ljava/lang/Class;Lcom/vkontakte/android/navigation/Navigator$ActivityNavigator;Landroid/os/Bundle;)V

    invoke-virtual {v0, p0}, Lcom/vkontakte/android/navigation/Navigator;->go(Landroid/content/Context;)Z

    .line 82
    return-void
.end method

.method private showButtonInfo(Ljava/lang/String;Z)V
    .locals 7
    .param p1, "price"    # Ljava/lang/String;
    .param p2, "canBePurchased"    # Z

    .prologue
    const/16 v4, 0x8

    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 193
    invoke-static {}, Lcom/vkontakte/android/data/PurchasesManager;->canUseInApps()Z

    move-result v0

    .line 194
    .local v0, "inappAvailable":Z
    if-eqz p2, :cond_1

    if-eqz v0, :cond_1

    move p2, v1

    .line 195
    :goto_0
    iget-object v3, p0, Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionFragment;->progressBar:Landroid/widget/ProgressBar;

    if-eqz v3, :cond_0

    iget-object v3, p0, Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionFragment;->buttonTitle:Landroid/widget/TextView;

    if-eqz v3, :cond_0

    iget-object v3, p0, Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionFragment;->buttonPrice:Landroid/widget/TextView;

    if-eqz v3, :cond_0

    iget-object v3, p0, Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionFragment;->buyButton:Landroid/view/View;

    if-eqz v3, :cond_0

    iget-object v3, p0, Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionFragment;->buyButtonDisable:Landroid/view/View;

    if-eqz v3, :cond_0

    .line 197
    if-eqz p2, :cond_2

    .line 198
    iget-object v3, p0, Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionFragment;->progressBar:Landroid/widget/ProgressBar;

    invoke-virtual {v3, v4}, Landroid/widget/ProgressBar;->setVisibility(I)V

    .line 199
    iget-object v3, p0, Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionFragment;->buttonPrice:Landroid/widget/TextView;

    invoke-virtual {v3, v2}, Landroid/widget/TextView;->setVisibility(I)V

    .line 200
    iget-object v3, p0, Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionFragment;->buttonPrice:Landroid/widget/TextView;

    iget-object v4, p0, Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionFragment;->buttonPrice:Landroid/widget/TextView;

    invoke-virtual {v4}, Landroid/widget/TextView;->getContext()Landroid/content/Context;

    move-result-object v4

    const v5, 0x7f0803ee

    new-array v6, v1, [Ljava/lang/Object;

    aput-object p1, v6, v2

    invoke-virtual {v4, v5, v6}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 201
    iget-object v3, p0, Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionFragment;->buttonTitle:Landroid/widget/TextView;

    invoke-virtual {v3, v2}, Landroid/widget/TextView;->setVisibility(I)V

    .line 202
    iget-object v2, p0, Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionFragment;->buyButton:Landroid/view/View;

    invoke-virtual {v2, v1}, Landroid/view/View;->setEnabled(Z)V

    .line 213
    :cond_0
    :goto_1
    return-void

    :cond_1
    move p2, v2

    .line 194
    goto :goto_0

    .line 204
    :cond_2
    iget-object v1, p0, Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionFragment;->buyButtonDisable:Landroid/view/View;

    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 205
    if-eqz v0, :cond_3

    .line 206
    iget-object v1, p0, Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionFragment;->buyButtonDisableText:Landroid/widget/TextView;

    const v2, 0x7f0803fa

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(I)V

    .line 210
    :goto_2
    iget-object v1, p0, Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionFragment;->buyButton:Landroid/view/View;

    invoke-virtual {v1, v4}, Landroid/view/View;->setVisibility(I)V

    goto :goto_1

    .line 208
    :cond_3
    iget-object v1, p0, Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionFragment;->buyButtonDisableText:Landroid/widget/TextView;

    const v2, 0x7f0803f9

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(I)V

    goto :goto_2
.end method


# virtual methods
.method public onAttach(Landroid/app/Activity;)V
    .locals 1
    .param p1, "activity"    # Landroid/app/Activity;

    .prologue
    .line 86
    invoke-super {p0, p1}, Lme/grishka/appkit/fragments/AppKitFragment;->onAttach(Landroid/app/Activity;)V

    .line 87
    iget-object v0, p0, Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionFragment;->helper:Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionHelper;

    invoke-virtual {v0, p1}, Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionHelper;->onAttach(Landroid/app/Activity;)V

    .line 88
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 217
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 227
    :cond_0
    :goto_0
    :pswitch_0
    return-void

    .line 219
    :pswitch_1
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/vkontakte/android/utils/Utils;->castToActivity(Landroid/content/Context;)Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->finish()V

    goto :goto_0

    .line 222
    :pswitch_2
    iget-object v0, p0, Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionFragment;->subscription:Lcom/vkontakte/android/data/Subscription;

    if-eqz v0, :cond_0

    .line 223
    iget-object v0, p0, Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionFragment;->helper:Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionHelper;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionFragment;->subscription:Lcom/vkontakte/android/data/Subscription;

    invoke-virtual {v0, p0, v1, p0}, Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionHelper;->purchase(Landroid/app/Fragment;Lcom/vkontakte/android/data/PurchasesManager$Product;Lcom/vkontakte/android/data/PurchasesManager$OnSuccessListener;)V

    goto :goto_0

    .line 217
    :pswitch_data_0
    .packed-switch 0x7f10029a
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_2
    .end packed-switch
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 1
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 62
    invoke-super {p0, p1}, Lme/grishka/appkit/fragments/AppKitFragment;->onCreate(Landroid/os/Bundle;)V

    .line 63
    const/4 v0, 0x1

    sput-boolean v0, Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionFragment;->showed:Z

    .line 64
    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 18
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 108
    const v14, 0x7f0300a0

    const/4 v15, 0x0

    move-object/from16 v0, p1

    move-object/from16 v1, p2

    invoke-virtual {v0, v14, v1, v15}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v13

    .line 109
    .local v13, "view":Landroid/view/View;
    const v14, 0x7f10029d

    invoke-virtual {v13, v14}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v14

    move-object/from16 v0, p0

    iput-object v14, v0, Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionFragment;->buyButton:Landroid/view/View;

    .line 110
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionFragment;->buyButton:Landroid/view/View;

    move-object/from16 v0, p0

    invoke-virtual {v14, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 111
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionFragment;->buyButton:Landroid/view/View;

    const/4 v15, 0x0

    invoke-virtual {v14, v15}, Landroid/view/View;->setEnabled(Z)V

    .line 113
    const v14, 0x7f10029f

    invoke-virtual {v13, v14}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v14

    move-object/from16 v0, p0

    iput-object v14, v0, Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionFragment;->buyButtonDisable:Landroid/view/View;

    .line 114
    const v14, 0x7f1002a0

    invoke-virtual {v13, v14}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v14

    check-cast v14, Landroid/widget/TextView;

    move-object/from16 v0, p0

    iput-object v14, v0, Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionFragment;->buyButtonDisableText:Landroid/widget/TextView;

    .line 116
    const v14, 0x7f100184

    invoke-virtual {v13, v14}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v14

    check-cast v14, Landroid/widget/ProgressBar;

    move-object/from16 v0, p0

    iput-object v14, v0, Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionFragment;->progressBar:Landroid/widget/ProgressBar;

    .line 117
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionFragment;->progressBar:Landroid/widget/ProgressBar;

    invoke-virtual {v14}, Landroid/widget/ProgressBar;->getIndeterminateDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v14

    const/4 v15, -0x1

    sget-object v16, Landroid/graphics/PorterDuff$Mode;->SRC_ATOP:Landroid/graphics/PorterDuff$Mode;

    invoke-virtual/range {v14 .. v16}, Landroid/graphics/drawable/Drawable;->setColorFilter(ILandroid/graphics/PorterDuff$Mode;)V

    .line 118
    const v14, 0x7f10019d

    invoke-virtual {v13, v14}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v14

    check-cast v14, Landroid/widget/TextView;

    move-object/from16 v0, p0

    iput-object v14, v0, Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionFragment;->buttonTitle:Landroid/widget/TextView;

    .line 119
    const v14, 0x7f10029e

    invoke-virtual {v13, v14}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v14

    check-cast v14, Landroid/widget/TextView;

    move-object/from16 v0, p0

    iput-object v14, v0, Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionFragment;->buttonPrice:Landroid/widget/TextView;

    .line 121
    const v14, 0x7f10029a

    invoke-virtual {v13, v14}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    .line 122
    .local v3, "closeBtn":Landroid/view/View;
    move-object/from16 v0, p0

    invoke-virtual {v3, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 123
    const v14, 0x7f10029b

    invoke-virtual {v13, v14}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    .line 124
    .local v4, "closeBtnImg":Landroid/view/View;
    invoke-virtual/range {p1 .. p1}, Landroid/view/LayoutInflater;->getContext()Landroid/content/Context;

    move-result-object v14

    const v15, 0x7f02018a

    invoke-static {v14, v15}, Lcom/vkontakte/android/ViewUtils;->getDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v6

    .line 125
    .local v6, "drawable":Landroid/graphics/drawable/Drawable;
    invoke-virtual/range {p1 .. p1}, Landroid/view/LayoutInflater;->getContext()Landroid/content/Context;

    move-result-object v14

    invoke-virtual {v14}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v14

    const v15, 0x7f0f005f

    invoke-virtual {v14, v15}, Landroid/content/res/Resources;->getColor(I)I

    move-result v8

    .line 126
    .local v8, "gray":I
    new-instance v7, Lcom/vkontakte/android/ui/drawable/RecoloredDrawable;

    invoke-direct {v7, v6, v8}, Lcom/vkontakte/android/ui/drawable/RecoloredDrawable;-><init>(Landroid/graphics/drawable/Drawable;I)V

    .line 127
    .end local v6    # "drawable":Landroid/graphics/drawable/Drawable;
    .local v7, "drawable":Landroid/graphics/drawable/Drawable;
    invoke-virtual {v4, v7}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 129
    const v14, 0x7f10029c

    invoke-virtual {v13, v14}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v12

    check-cast v12, Landroid/widget/TextView;

    .line 131
    .local v12, "textView":Landroid/widget/TextView;
    invoke-virtual {v12}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v14

    invoke-static {v14}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v11

    .line 132
    .local v11, "string":Ljava/lang/String;
    new-instance v2, Landroid/text/SpannableStringBuilder;

    invoke-direct {v2, v11}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 133
    .local v2, "builder":Landroid/text/SpannableStringBuilder;
    invoke-virtual/range {p0 .. p0}, Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionFragment;->getActivity()Landroid/app/Activity;

    move-result-object v14

    const v15, 0x7f020216

    invoke-static {v14, v15}, Lcom/vkontakte/android/ViewUtils;->getDrawable(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object v5

    .line 134
    .local v5, "d":Landroid/graphics/drawable/Drawable;
    const/4 v14, 0x0

    const/4 v15, 0x0

    invoke-virtual {v5}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v16

    invoke-virtual {v5}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v17

    move/from16 v0, v16

    move/from16 v1, v17

    invoke-virtual {v5, v14, v15, v0, v1}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 135
    new-instance v9, Landroid/text/style/ImageSpan;

    const/4 v14, 0x1

    invoke-direct {v9, v5, v14}, Landroid/text/style/ImageSpan;-><init>(Landroid/graphics/drawable/Drawable;I)V

    .line 136
    .local v9, "imageSpan":Landroid/text/style/ImageSpan;
    const-string/jumbo v14, "boom"

    invoke-virtual {v11, v14}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v10

    .line 137
    .local v10, "startIndex":I
    add-int/lit8 v14, v10, 0x4

    const/4 v15, 0x0

    invoke-virtual {v2, v9, v10, v14, v15}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 139
    invoke-virtual {v12, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 141
    return-object v13
.end method

.method public onDestroy()V
    .locals 1

    .prologue
    .line 68
    invoke-super {p0}, Lme/grishka/appkit/fragments/AppKitFragment;->onDestroy()V

    .line 69
    const/4 v0, 0x0

    sput-boolean v0, Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionFragment;->showed:Z

    .line 70
    return-void
.end method

.method public onDestroyView()V
    .locals 1

    .prologue
    const/4 v0, 0x0

    .line 185
    invoke-super {p0}, Lme/grishka/appkit/fragments/AppKitFragment;->onDestroyView()V

    .line 186
    iput-object v0, p0, Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionFragment;->progressBar:Landroid/widget/ProgressBar;

    .line 187
    iput-object v0, p0, Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionFragment;->buttonPrice:Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionFragment;->buttonTitle:Landroid/widget/TextView;

    .line 188
    iput-object v0, p0, Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionFragment;->buyButton:Landroid/view/View;

    .line 189
    iput-object v0, p0, Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionFragment;->buyButtonDisable:Landroid/view/View;

    .line 190
    return-void
.end method

.method public onDetach()V
    .locals 2

    .prologue
    .line 92
    iget-object v0, p0, Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionFragment;->helper:Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionHelper;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionHelper;->onDetach(Landroid/app/Activity;)V

    .line 93
    invoke-super {p0}, Lme/grishka/appkit/fragments/AppKitFragment;->onDetach()V

    .line 94
    return-void
.end method

.method public onSuccess(Lcom/vkontakte/android/data/Subscription;)V
    .locals 1
    .param p1, "subscription"    # Lcom/vkontakte/android/data/Subscription;

    .prologue
    .line 98
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    .line 99
    .local v0, "activity":Landroid/app/Activity;
    if-eqz v0, :cond_0

    .line 100
    invoke-static {v0}, Lcom/vkontakte/android/fragments/money/MusicSubscriptionsWasBoughtFragment;->show(Landroid/content/Context;)V

    .line 101
    invoke-virtual {v0}, Landroid/app/Activity;->finish()V

    .line 103
    :cond_0
    return-void
.end method

.method public bridge synthetic onSuccess(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 42
    check-cast p1, Lcom/vkontakte/android/data/Subscription;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionFragment;->onSuccess(Lcom/vkontakte/android/data/Subscription;)V

    return-void
.end method

.method public onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .locals 0
    .param p1, "view"    # Landroid/view/View;
    .param p2, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    .line 146
    invoke-super {p0, p1, p2}, Lme/grishka/appkit/fragments/AppKitFragment;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    .line 147
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/money/BuyMusicSubscriptionFragment;->loadStockItemInfo()V

    .line 148
    return-void
.end method
