.class final Lcom/vk/sharing/SharingActivity$PresenterDelegateToIntAdapter;
.super Ljava/lang/Object;
.source "SharingActivity.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/sharing/SharingActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "PresenterDelegateToIntAdapter"
.end annotation


# static fields
.field private static final COMMON:I = 0x1

.field private static final GROUP_PICK:I = 0x6

.field private static final GROUP_POST:I = 0x4

.field private static final GROUP_SEARCH:I = 0x5

.field private static final TARGET_SEARCH:I = 0x2

.field private static final WALL_POST:I = 0x3


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 461
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static fromDelegate(Lcom/vk/sharing/BasePresenter;)I
    .locals 2
    .param p0, "delegate"    # Lcom/vk/sharing/BasePresenter;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 424
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    .line 425
    .local v0, "delegateClass":Ljava/lang/Class;, "Ljava/lang/Class<+Lcom/vk/sharing/BasePresenter;>;"
    const-class v1, Lcom/vk/sharing/DialogSearchPresenter;

    invoke-virtual {v1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 426
    const/4 v1, 0x2

    .line 438
    :goto_0
    return v1

    .line 427
    :cond_0
    const-class v1, Lcom/vk/sharing/WallPostPresenter;

    invoke-virtual {v1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 428
    const/4 v1, 0x3

    goto :goto_0

    .line 429
    :cond_1
    const-class v1, Lcom/vk/sharing/GroupPostPresenter;

    invoke-virtual {v1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 430
    const/4 v1, 0x4

    goto :goto_0

    .line 431
    :cond_2
    const-class v1, Lcom/vk/sharing/GroupSearchPresenter;

    invoke-virtual {v1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 432
    const/4 v1, 0x5

    goto :goto_0

    .line 433
    :cond_3
    const-class v1, Lcom/vk/sharing/GroupPickerPresenter;

    invoke-virtual {v1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 434
    const/4 v1, 0x6

    goto :goto_0

    .line 438
    :cond_4
    const/4 v1, 0x1

    goto :goto_0
.end method

.method static toDelegate(Lcom/vk/sharing/SharingActivity;I)Lcom/vk/sharing/BasePresenter;
    .locals 1
    .param p0, "activity"    # Lcom/vk/sharing/SharingActivity;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1, "delegateId"    # I
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 444
    packed-switch p1, :pswitch_data_0

    .line 457
    new-instance v0, Lcom/vk/sharing/CommonPresenter;

    invoke-direct {v0, p0}, Lcom/vk/sharing/CommonPresenter;-><init>(Lcom/vk/sharing/BasePresenter$DelegateContext;)V

    :goto_0
    return-object v0

    .line 446
    :pswitch_0
    new-instance v0, Lcom/vk/sharing/DialogSearchPresenter;

    invoke-direct {v0, p0}, Lcom/vk/sharing/DialogSearchPresenter;-><init>(Lcom/vk/sharing/BasePresenter$DelegateContext;)V

    goto :goto_0

    .line 448
    :pswitch_1
    new-instance v0, Lcom/vk/sharing/WallPostPresenter;

    invoke-direct {v0, p0}, Lcom/vk/sharing/WallPostPresenter;-><init>(Lcom/vk/sharing/BasePresenter$DelegateContext;)V

    goto :goto_0

    .line 450
    :pswitch_2
    new-instance v0, Lcom/vk/sharing/GroupPostPresenter;

    invoke-direct {v0, p0}, Lcom/vk/sharing/GroupPostPresenter;-><init>(Lcom/vk/sharing/BasePresenter$DelegateContext;)V

    goto :goto_0

    .line 452
    :pswitch_3
    new-instance v0, Lcom/vk/sharing/GroupSearchPresenter;

    invoke-direct {v0, p0}, Lcom/vk/sharing/GroupSearchPresenter;-><init>(Lcom/vk/sharing/BasePresenter$DelegateContext;)V

    goto :goto_0

    .line 454
    :pswitch_4
    new-instance v0, Lcom/vk/sharing/GroupPickerPresenter;

    invoke-direct {v0, p0}, Lcom/vk/sharing/GroupPickerPresenter;-><init>(Lcom/vk/sharing/BasePresenter$DelegateContext;)V

    goto :goto_0

    .line 444
    nop

    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
    .end packed-switch
.end method
