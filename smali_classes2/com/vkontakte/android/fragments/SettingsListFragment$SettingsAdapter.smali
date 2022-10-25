.class Lcom/vkontakte/android/fragments/SettingsListFragment$SettingsAdapter;
.super Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter;
.source "SettingsListFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/SettingsListFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "SettingsAdapter"
.end annotation


# static fields
.field private static final TYPE_BOTTOM:I = 0x3

.field private static final TYPE_HEADER:I = 0x5

.field private static final TYPE_ICON_PREF:I = 0x2

.field private static final TYPE_LOGOUT:I = 0x4

.field private static final TYPE_TITLE:I = 0x1


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/SettingsListFragment;


# direct methods
.method public constructor <init>(Lcom/vkontakte/android/fragments/SettingsListFragment;Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$DataDelegate;)V
    .locals 0
    .param p2, "dataDelegate"    # Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$DataDelegate;

    .prologue
    .line 254
    iput-object p1, p0, Lcom/vkontakte/android/fragments/SettingsListFragment$SettingsAdapter;->this$0:Lcom/vkontakte/android/fragments/SettingsListFragment;

    .line 255
    invoke-direct {p0, p2}, Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter;-><init>(Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$DataDelegate;)V

    .line 256
    return-void
.end method


# virtual methods
.method createData()Ljava/util/ArrayList;
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;",
            ">;"
        }
    .end annotation

    .prologue
    const v9, 0x7f02005d

    const/4 v8, 0x1

    const/4 v7, 0x3

    const v6, 0x7f0f0080

    const/4 v5, 0x2

    .line 259
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 261
    .local v0, "data":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;>;"
    iget-object v1, p0, Lcom/vkontakte/android/fragments/SettingsListFragment$SettingsAdapter;->this$0:Lcom/vkontakte/android/fragments/SettingsListFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/SettingsListFragment;->access$200(Lcom/vkontakte/android/fragments/SettingsListFragment;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 262
    const v1, 0x7f0200e6

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {v7, v1}, Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;->top(ILjava/lang/Object;)Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 266
    :goto_0
    const/4 v1, 0x5

    const/4 v2, 0x0

    invoke-static {v1, v2}, Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;->bottom(ILjava/lang/Object;)Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 268
    const v1, 0x7f08035a

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {v8, v1}, Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;->top(ILjava/lang/Object;)Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 269
    new-instance v1, Lcom/vkontakte/android/fragments/SettingsListFragment$Item;

    const v2, 0x7f020284

    const v3, 0x7f08063a

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const-class v4, Lcom/vkontakte/android/fragments/SettingsNotificationsFragment;

    invoke-direct {v1, v2, v6, v3, v4}, Lcom/vkontakte/android/fragments/SettingsListFragment$Item;-><init>(IILjava/lang/Object;Ljava/lang/Class;)V

    invoke-static {v5, v1}, Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;->middle(ILjava/lang/Object;)Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 270
    new-instance v1, Lcom/vkontakte/android/fragments/SettingsListFragment$Item;

    const v2, 0x7f020281

    const v3, 0x7f080628

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const-class v4, Lcom/vkontakte/android/fragments/SettingsGeneralFragment;

    invoke-direct {v1, v2, v6, v3, v4}, Lcom/vkontakte/android/fragments/SettingsListFragment$Item;-><init>(IILjava/lang/Object;Ljava/lang/Class;)V

    invoke-static {v5, v1}, Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;->middle(ILjava/lang/Object;)Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 271
    new-instance v1, Lcom/vkontakte/android/fragments/SettingsListFragment$Item;

    const v2, 0x7f02027e

    const v3, 0x7f08060b

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const-class v4, Lcom/vkontakte/android/fragments/SettingsAccountFragment;

    invoke-direct {v1, v2, v6, v3, v4}, Lcom/vkontakte/android/fragments/SettingsListFragment$Item;-><init>(IILjava/lang/Object;Ljava/lang/Class;)V

    invoke-static {v5, v1}, Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;->middle(ILjava/lang/Object;)Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 272
    new-instance v1, Lcom/vkontakte/android/fragments/SettingsListFragment$Item;

    const v2, 0x7f020285

    const v3, 0x7f08053a

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const-class v4, Lcom/vkontakte/android/fragments/PrivacySettingsListFragment;

    invoke-direct {v1, v2, v6, v3, v4}, Lcom/vkontakte/android/fragments/SettingsListFragment$Item;-><init>(IILjava/lang/Object;Ljava/lang/Class;)V

    invoke-static {v5, v1}, Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;->middle(ILjava/lang/Object;)Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 273
    new-instance v1, Lcom/vkontakte/android/fragments/SettingsListFragment$Item;

    const v2, 0x7f02027f

    const v3, 0x7f080112

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const-class v4, Lcom/vkontakte/android/fragments/userlist/BlacklistFragment;

    invoke-direct {v1, v2, v6, v3, v4}, Lcom/vkontakte/android/fragments/SettingsListFragment$Item;-><init>(IILjava/lang/Object;Ljava/lang/Class;)V

    invoke-static {v5, v1}, Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;->middle(ILjava/lang/Object;)Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 274
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vkontakte/android/auth/VKAccount;->isMusicRestricted()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 275
    new-instance v1, Lcom/vkontakte/android/fragments/SettingsListFragment$Item;

    const v2, 0x7f0201f1

    const v3, 0x7f0806df

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    new-instance v4, Lcom/vkontakte/android/fragments/money/SubscriptionFragment$Builder;

    invoke-direct {v4, v8}, Lcom/vkontakte/android/fragments/money/SubscriptionFragment$Builder;-><init>(I)V

    invoke-direct {v1, v2, v6, v3, v4}, Lcom/vkontakte/android/fragments/SettingsListFragment$Item;-><init>(IILjava/lang/Object;Lcom/vkontakte/android/navigation/Navigator;)V

    invoke-static {v5, v1}, Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;->middle(ILjava/lang/Object;)Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 277
    :cond_0
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v1

    iget-boolean v1, v1, Lcom/vkontakte/android/auth/VKAccount;->moneyTransfersAvailable:Z

    if-eqz v1, :cond_1

    .line 278
    new-instance v1, Lcom/vkontakte/android/fragments/SettingsListFragment$Item;

    const v2, 0x7f020283

    const v3, 0x7f08036d

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const-class v4, Lcom/vkontakte/android/fragments/money/MoneyTransfersHistoryFragment;

    invoke-direct {v1, v2, v6, v3, v4}, Lcom/vkontakte/android/fragments/SettingsListFragment$Item;-><init>(IILjava/lang/Object;Ljava/lang/Class;)V

    invoke-static {v5, v1}, Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;->middle(ILjava/lang/Object;)Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 280
    :cond_1
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v1

    iget-boolean v1, v1, Lcom/vkontakte/android/auth/VKAccount;->debugAvailable:Z

    if-eqz v1, :cond_2

    .line 281
    new-instance v1, Lcom/vkontakte/android/fragments/SettingsListFragment$Item;

    const v2, 0x7f020280

    const v3, 0x7f0807e9

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    const-class v4, Lcom/vkontakte/android/fragments/SettingsDebugFragment;

    invoke-direct {v1, v2, v6, v3, v4}, Lcom/vkontakte/android/fragments/SettingsListFragment$Item;-><init>(IILjava/lang/Object;Ljava/lang/Class;)V

    invoke-static {v5, v1}, Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;->middle(ILjava/lang/Object;)Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 283
    :cond_2
    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {v7, v1}, Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;->bottom(ILjava/lang/Object;)Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 285
    const v1, 0x7f080303

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {v8, v1}, Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;->top(ILjava/lang/Object;)Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 286
    new-instance v1, Lcom/vkontakte/android/fragments/SettingsListFragment$Item;

    const v2, 0x7f020282

    const v3, 0x7f080303

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-static {p0}, Lcom/vkontakte/android/fragments/SettingsListFragment$SettingsAdapter$$Lambda$1;->lambdaFactory$(Lcom/vkontakte/android/fragments/SettingsListFragment$SettingsAdapter;)Ljava/lang/Runnable;

    move-result-object v4

    invoke-direct {v1, v2, v6, v3, v4}, Lcom/vkontakte/android/fragments/SettingsListFragment$Item;-><init>(IILjava/lang/Object;Ljava/lang/Runnable;)V

    invoke-static {v5, v1}, Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;->middle(ILjava/lang/Object;)Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 289
    new-instance v1, Lcom/vkontakte/android/fragments/SettingsListFragment$Item;

    const v2, 0x7f02027d

    const v3, 0x7f080357

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-static {p0}, Lcom/vkontakte/android/fragments/SettingsListFragment$SettingsAdapter$$Lambda$2;->lambdaFactory$(Lcom/vkontakte/android/fragments/SettingsListFragment$SettingsAdapter;)Ljava/lang/Runnable;

    move-result-object v4

    invoke-direct {v1, v2, v6, v3, v4}, Lcom/vkontakte/android/fragments/SettingsListFragment$Item;-><init>(IILjava/lang/Object;Ljava/lang/Runnable;)V

    invoke-static {v5, v1}, Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;->middle(ILjava/lang/Object;)Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 292
    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {v7, v1}, Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;->bottom(ILjava/lang/Object;)Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 294
    const/4 v1, 0x4

    const v2, 0x7f080341

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;->topBottom(ILjava/lang/Object;)Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 296
    return-object v0

    .line 264
    :cond_3
    const v1, 0x7f0200e6

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {v7, v1}, Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;->middle(ILjava/lang/Object;)Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0
.end method

.method synthetic lambda$createData$0()V
    .locals 2

    .prologue
    .line 287
    new-instance v0, Lcom/vkontakte/android/fragments/WebViewFragment$Builder;

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vkontakte/android/auth/VKAccount;->getSupportUrl()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/vkontakte/android/fragments/WebViewFragment$Builder;-><init>(Ljava/lang/String;)V

    .line 288
    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/WebViewFragment$Builder;->openInternally()Lcom/vkontakte/android/fragments/WebViewFragment$Builder;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/fragments/SettingsListFragment$SettingsAdapter;->this$0:Lcom/vkontakte/android/fragments/SettingsListFragment;

    invoke-virtual {v1}, Lcom/vkontakte/android/fragments/SettingsListFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/WebViewFragment$Builder;->go(Landroid/content/Context;)Z

    .line 287
    return-void
.end method

.method synthetic lambda$createData$1()V
    .locals 1

    .prologue
    .line 290
    iget-object v0, p0, Lcom/vkontakte/android/fragments/SettingsListFragment$SettingsAdapter;->this$0:Lcom/vkontakte/android/fragments/SettingsListFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/SettingsListFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-static {v0}, Lcom/vkontakte/android/MainActivity;->showAbout(Landroid/content/Context;)V

    .line 291
    return-void
.end method

.method public bridge synthetic onCreateViewHolder(Landroid/view/ViewGroup;I)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .locals 1

    .prologue
    .line 246
    invoke-virtual {p0, p1, p2}, Lcom/vkontakte/android/fragments/SettingsListFragment$SettingsAdapter;->onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/vkontakte/android/ui/holder/RecyclerHolder;

    move-result-object v0

    return-object v0
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/vkontakte/android/ui/holder/RecyclerHolder;
    .locals 2
    .param p1, "parent"    # Landroid/view/ViewGroup;
    .param p2, "viewType"    # I

    .prologue
    .line 301
    packed-switch p2, :pswitch_data_0

    .line 321
    :pswitch_0
    new-instance v0, Lcom/vkontakte/android/ui/holder/commons/PreferenceIconItemHolder;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/SettingsListFragment$SettingsAdapter;->this$0:Lcom/vkontakte/android/fragments/SettingsListFragment;

    invoke-direct {v0, p1, v1}, Lcom/vkontakte/android/ui/holder/commons/PreferenceIconItemHolder;-><init>(Landroid/view/ViewGroup;Lcom/vkontakte/android/functions/VoidF1;)V

    :goto_0
    return-object v0

    .line 303
    :pswitch_1
    new-instance v0, Lcom/vkontakte/android/fragments/SettingsListFragment$SettingsAdapter$1;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/SettingsListFragment$SettingsAdapter;->this$0:Lcom/vkontakte/android/fragments/SettingsListFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/SettingsListFragment;->access$300(Lcom/vkontakte/android/fragments/SettingsListFragment;)Landroid/view/View;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lcom/vkontakte/android/fragments/SettingsListFragment$SettingsAdapter$1;-><init>(Lcom/vkontakte/android/fragments/SettingsListFragment$SettingsAdapter;Landroid/view/View;)V

    goto :goto_0

    .line 309
    :pswitch_2
    invoke-static {p1}, Lcom/vkontakte/android/ui/holder/commons/TitleHolder;->blueTitle(Landroid/view/ViewGroup;)Lcom/vkontakte/android/ui/holder/commons/TitleHolder;

    move-result-object v0

    goto :goto_0

    .line 311
    :pswitch_3
    new-instance v0, Lcom/vkontakte/android/ui/holder/commons/BackgroundHolder;

    invoke-direct {v0, p1}, Lcom/vkontakte/android/ui/holder/commons/BackgroundHolder;-><init>(Landroid/view/ViewGroup;)V

    goto :goto_0

    .line 313
    :pswitch_4
    new-instance v0, Lcom/vkontakte/android/fragments/SettingsListFragment$SettingsAdapter$2;

    invoke-direct {v0, p0, p1}, Lcom/vkontakte/android/fragments/SettingsListFragment$SettingsAdapter$2;-><init>(Lcom/vkontakte/android/fragments/SettingsListFragment$SettingsAdapter;Landroid/view/ViewGroup;)V

    goto :goto_0

    .line 301
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_0
        :pswitch_3
        :pswitch_4
        :pswitch_1
    .end packed-switch
.end method
