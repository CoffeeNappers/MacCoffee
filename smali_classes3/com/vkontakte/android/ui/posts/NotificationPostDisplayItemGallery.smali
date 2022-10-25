.class public Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery;
.super Lcom/vkontakte/android/ui/posts/PostDisplayItem;
.source "NotificationPostDisplayItemGallery.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;
    }
.end annotation


# static fields
.field static final BUTTONS:[I

.field static final BUTTON_CELL:I = 0x0

.field static final BUTTON_NEW_POST:I = 0x3

.field static final BUTTON_NULL:I

.field static final BUTTON_PRIMARY:I = 0x1

.field static final BUTTON_SECONDARY:I = 0x2

.field private static final GALLERY_PHOTO_INTENT:I = 0x2

.field static final HEADERS:[I

.field private static final LAYOUT_APP:I = 0x0

.field private static final LAYOUT_BANNER:I = 0x2

.field private static final LAYOUT_INFO:I = 0x1

.field private static final LAYOUT_NEW_POST:I = 0x3


# instance fields
.field private final userNotification:Lcom/vkontakte/android/data/UserNotification;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 504
    const/4 v0, 0x4

    new-array v0, v0, [I

    fill-array-data v0, :array_0

    sput-object v0, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery;->HEADERS:[I

    .line 510
    const/4 v0, 0x5

    new-array v0, v0, [I

    fill-array-data v0, :array_1

    sput-object v0, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery;->BUTTONS:[I

    .line 517
    sget-object v0, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery;->BUTTONS:[I

    array-length v0, v0

    add-int/lit8 v0, v0, -0x1

    sput v0, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery;->BUTTON_NULL:I

    return-void

    .line 504
    :array_0
    .array-data 4
        0x7f030180
        0x7f030181
        0x7f030182
        0x7f030183
    .end array-data

    .line 510
    :array_1
    .array-data 4
        0x7f03017b
        0x7f03017c
        0x7f03017d
        0x7f03017e
        0x7f03017f
    .end array-data
.end method

.method public constructor <init>(Lcom/vkontakte/android/data/UserNotification;)V
    .locals 2
    .param p1, "userNotification"    # Lcom/vkontakte/android/data/UserNotification;

    .prologue
    .line 72
    iget v0, p1, Lcom/vkontakte/android/data/UserNotification;->id:I

    const v1, 0x77359401

    invoke-direct {p0, v0, v1}, Lcom/vkontakte/android/ui/posts/PostDisplayItem;-><init>(II)V

    .line 73
    iput-object p1, p0, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery;->userNotification:Lcom/vkontakte/android/data/UserNotification;

    .line 74
    return-void
.end method

.method public static createView(Landroid/app/Fragment;I)Landroid/view/View;
    .locals 2
    .param p0, "fragment"    # Landroid/app/Fragment;
    .param p1, "viewType"    # I

    .prologue
    .line 77
    new-instance v0, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;

    invoke-virtual {p0}, Landroid/app/Fragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-direct {v0, v1, p1}, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;-><init>(Landroid/app/Activity;I)V

    iget-object v0, v0, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;->itemView:Landroid/view/View;

    return-object v0
.end method

.method static createViewType(IIZ)I
    .locals 2
    .param p0, "style"    # I
    .param p1, "buttonStyle"    # I
    .param p2, "hasUsers"    # Z

    .prologue
    .line 528
    if-eqz p2, :cond_0

    const/4 v0, 0x1

    :goto_0
    add-int/lit8 v0, v0, 0x17

    mul-int/lit8 v1, p1, 0xa

    add-int/2addr v0, v1

    mul-int/lit8 v1, p0, 0x64

    add-int/2addr v0, v1

    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method static getButtonStyle(I)I
    .locals 1
    .param p0, "viewType"    # I

    .prologue
    .line 578
    add-int/lit8 v0, p0, -0x17

    div-int/lit8 v0, v0, 0xa

    rem-int/lit8 v0, v0, 0xa

    return v0
.end method

.method static getButtonStyle(Lcom/vkontakte/android/data/UserNotification;)I
    .locals 7
    .param p0, "notification"    # Lcom/vkontakte/android/data/UserNotification;

    .prologue
    const/4 v3, 0x3

    const/4 v2, 0x2

    const/4 v1, 0x1

    const/4 v0, 0x0

    .line 562
    iget-object v5, p0, Lcom/vkontakte/android/data/UserNotification;->buttonStyle:Ljava/lang/String;

    const/4 v4, -0x1

    invoke-virtual {v5}, Ljava/lang/String;->hashCode()I

    move-result v6

    sparse-switch v6, :sswitch_data_0

    :cond_0
    :goto_0
    packed-switch v4, :pswitch_data_0

    .line 572
    sget v0, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery;->BUTTON_NULL:I

    :goto_1
    :pswitch_0
    return v0

    .line 562
    :sswitch_0
    const-string/jumbo v6, "cell"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    move v4, v0

    goto :goto_0

    :sswitch_1
    const-string/jumbo v6, "primary"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    move v4, v1

    goto :goto_0

    :sswitch_2
    const-string/jumbo v6, "secondary"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    move v4, v2

    goto :goto_0

    :sswitch_3
    const-string/jumbo v6, "btn_new_post"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    move v4, v3

    goto :goto_0

    :pswitch_1
    move v0, v1

    .line 566
    goto :goto_1

    :pswitch_2
    move v0, v2

    .line 568
    goto :goto_1

    :pswitch_3
    move v0, v3

    .line 570
    goto :goto_1

    .line 562
    :sswitch_data_0
    .sparse-switch
        -0x4753399e -> :sswitch_3
        -0x30bb8e8c -> :sswitch_2
        -0x12c2f1fe -> :sswitch_1
        0x2e8962 -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method

.method static getStyle(I)I
    .locals 1
    .param p0, "viewType"    # I

    .prologue
    .line 557
    add-int/lit8 v0, p0, -0x17

    div-int/lit8 v0, v0, 0x64

    return v0
.end method

.method static getStyle(Lcom/vkontakte/android/data/UserNotification;)I
    .locals 7
    .param p0, "notification"    # Lcom/vkontakte/android/data/UserNotification;

    .prologue
    const/4 v3, 0x3

    const/4 v1, 0x2

    const/4 v2, 0x1

    const/4 v0, 0x0

    .line 536
    iget-object v4, p0, Lcom/vkontakte/android/data/UserNotification;->layout:Ljava/lang/String;

    invoke-static {v4}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    const/4 v4, -0x1

    invoke-virtual {v5}, Ljava/lang/String;->hashCode()I

    move-result v6

    sparse-switch v6, :sswitch_data_0

    :cond_0
    :goto_0
    packed-switch v4, :pswitch_data_0

    .line 549
    new-array v1, v2, [Ljava/lang/Object;

    const-string/jumbo v2, "error: Unknown newsfeed layout type"

    aput-object v2, v1, v0

    invoke-static {v1}, Lcom/vkontakte/android/utils/L;->e([Ljava/lang/Object;)V

    .line 550
    :goto_1
    :pswitch_0
    return v0

    .line 536
    :sswitch_0
    const-string/jumbo v6, "app"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    move v4, v0

    goto :goto_0

    :sswitch_1
    const-string/jumbo v6, "banner"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    move v4, v2

    goto :goto_0

    :sswitch_2
    const-string/jumbo v6, "info"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    move v4, v1

    goto :goto_0

    :sswitch_3
    const-string/jumbo v6, "new_post"

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    move v4, v3

    goto :goto_0

    :pswitch_1
    move v0, v1

    .line 540
    goto :goto_1

    :pswitch_2
    move v0, v2

    .line 542
    goto :goto_1

    :pswitch_3
    move v0, v3

    .line 544
    goto :goto_1

    .line 536
    :sswitch_data_0
    .sparse-switch
        -0x533a80d4 -> :sswitch_1
        0x17a21 -> :sswitch_0
        0x3164ae -> :sswitch_2
        0x5216abdf -> :sswitch_3
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method

.method static hasUsers(I)Z
    .locals 1
    .param p0, "viewType"    # I

    .prologue
    .line 586
    add-int/lit8 v0, p0, -0x17

    rem-int/lit8 v0, v0, 0xa

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method static hasUsers(Lcom/vkontakte/android/data/UserNotification;)Z
    .locals 1
    .param p0, "notification"    # Lcom/vkontakte/android/data/UserNotification;

    .prologue
    .line 582
    iget-object v0, p0, Lcom/vkontakte/android/data/UserNotification;->profiles:Ljava/util/ArrayList;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static isNotificationViewType(I)Z
    .locals 3
    .param p0, "viewType"    # I

    .prologue
    .line 524
    invoke-static {p0}, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery;->getStyle(I)I

    move-result v0

    invoke-static {p0}, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery;->getButtonStyle(I)I

    move-result v1

    invoke-static {p0}, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery;->hasUsers(I)Z

    move-result v2

    invoke-static {v0, v1, v2}, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery;->createViewType(IIZ)I

    move-result v0

    if-ne p0, v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method public getImageCount()I
    .locals 1

    .prologue
    .line 87
    const/4 v0, 0x0

    return v0
.end method

.method public getImageURL(I)Ljava/lang/String;
    .locals 1
    .param p1, "image"    # I

    .prologue
    .line 92
    const/4 v0, 0x0

    return-object v0
.end method

.method public getType()I
    .locals 3

    .prologue
    .line 82
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery;->userNotification:Lcom/vkontakte/android/data/UserNotification;

    invoke-static {v0}, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery;->getStyle(Lcom/vkontakte/android/data/UserNotification;)I

    move-result v0

    iget-object v1, p0, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery;->userNotification:Lcom/vkontakte/android/data/UserNotification;

    invoke-static {v1}, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery;->getButtonStyle(Lcom/vkontakte/android/data/UserNotification;)I

    move-result v1

    iget-object v2, p0, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery;->userNotification:Lcom/vkontakte/android/data/UserNotification;

    invoke-static {v2}, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery;->hasUsers(Lcom/vkontakte/android/data/UserNotification;)Z

    move-result v2

    invoke-static {v0, v1, v2}, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery;->createViewType(IIZ)I

    move-result v0

    return v0
.end method

.method public onBindView(Landroid/view/View;)V
    .locals 2
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 97
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;

    iget-object v1, p0, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery;->userNotification:Lcom/vkontakte/android/data/UserNotification;

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/ui/posts/NotificationPostDisplayItemGallery$ViewHolder;->bind(Ljava/lang/Object;)V

    .line 98
    return-void
.end method
