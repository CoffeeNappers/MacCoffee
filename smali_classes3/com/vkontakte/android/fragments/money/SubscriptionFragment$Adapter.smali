.class Lcom/vkontakte/android/fragments/money/SubscriptionFragment$Adapter;
.super Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter;
.source "SubscriptionFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/money/SubscriptionFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "Adapter"
.end annotation


# static fields
.field static final TYPE_BG:I = 0x1

.field static final TYPE_BOTTOM_TEXT:I = 0x2

.field static final TYPE_CONTROL_SUBS:I = 0x3

.field static final TYPE_HEADER:I


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/money/SubscriptionFragment;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/fragments/money/SubscriptionFragment;)V
    .locals 0

    .prologue
    .line 164
    iput-object p1, p0, Lcom/vkontakte/android/fragments/money/SubscriptionFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/money/SubscriptionFragment;

    invoke-direct {p0}, Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/vkontakte/android/fragments/money/SubscriptionFragment;Lcom/vkontakte/android/fragments/money/SubscriptionFragment$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/vkontakte/android/fragments/money/SubscriptionFragment;
    .param p2, "x1"    # Lcom/vkontakte/android/fragments/money/SubscriptionFragment$1;

    .prologue
    .line 164
    invoke-direct {p0, p1}, Lcom/vkontakte/android/fragments/money/SubscriptionFragment$Adapter;-><init>(Lcom/vkontakte/android/fragments/money/SubscriptionFragment;)V

    return-void
.end method


# virtual methods
.method public bridge synthetic onCreateViewHolder(Landroid/view/ViewGroup;I)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .locals 1

    .prologue
    .line 164
    invoke-virtual {p0, p1, p2}, Lcom/vkontakte/android/fragments/money/SubscriptionFragment$Adapter;->onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/vkontakte/android/ui/holder/RecyclerHolder;

    move-result-object v0

    return-object v0
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/vkontakte/android/ui/holder/RecyclerHolder;
    .locals 3
    .param p1, "parent"    # Landroid/view/ViewGroup;
    .param p2, "viewType"    # I

    .prologue
    .line 173
    packed-switch p2, :pswitch_data_0

    .line 183
    const/4 v0, 0x0

    :goto_0
    return-object v0

    .line 175
    :pswitch_0
    new-instance v0, Lcom/vkontakte/android/fragments/money/SubscriptionFragment$ControlSubscriptionHolder;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/money/SubscriptionFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/money/SubscriptionFragment;

    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/vkontakte/android/fragments/money/SubscriptionFragment$ControlSubscriptionHolder;-><init>(Lcom/vkontakte/android/fragments/money/SubscriptionFragment;Landroid/content/Context;)V

    goto :goto_0

    .line 177
    :pswitch_1
    new-instance v0, Lcom/vkontakte/android/fragments/money/SubscriptionFragment$DescriptionHolder;

    invoke-direct {v0, p1}, Lcom/vkontakte/android/fragments/money/SubscriptionFragment$DescriptionHolder;-><init>(Landroid/view/ViewGroup;)V

    goto :goto_0

    .line 179
    :pswitch_2
    new-instance v0, Lcom/vkontakte/android/ui/holder/commons/BackgroundHolder;

    invoke-direct {v0, p1}, Lcom/vkontakte/android/ui/holder/commons/BackgroundHolder;-><init>(Landroid/view/ViewGroup;)V

    goto :goto_0

    .line 181
    :pswitch_3
    new-instance v0, Lcom/vkontakte/android/ui/holder/money/SubscriptionHeaderHolder;

    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/vkontakte/android/ui/holder/money/SubscriptionHeaderHolder;-><init>(Landroid/content/Context;)V

    goto :goto_0

    .line 173
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
