.class Lcom/vkontakte/android/fragments/ProfileFragment$OverviewInfoItem;
.super Lcom/vkontakte/android/fragments/ProfileFragment$InfoItem;
.source "ProfileFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/ProfileFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "OverviewInfoItem"
.end annotation


# instance fields
.field public icon:Landroid/graphics/drawable/Drawable;

.field public onClick:Ljava/lang/Runnable;

.field public photos:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public text:Ljava/lang/CharSequence;

.field final synthetic this$0:Lcom/vkontakte/android/fragments/ProfileFragment;


# direct methods
.method public constructor <init>(Lcom/vkontakte/android/fragments/ProfileFragment;ILjava/lang/CharSequence;Ljava/lang/Runnable;)V
    .locals 1
    .param p2, "icon"    # I
    .param p3, "text"    # Ljava/lang/CharSequence;
    .param p4, "onClick"    # Ljava/lang/Runnable;

    .prologue
    .line 3595
    iput-object p1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$OverviewInfoItem;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/vkontakte/android/fragments/ProfileFragment$InfoItem;-><init>(Lcom/vkontakte/android/fragments/ProfileFragment;Lcom/vkontakte/android/fragments/ProfileFragment$1;)V

    .line 3593
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$OverviewInfoItem;->photos:Ljava/util/ArrayList;

    .line 3596
    invoke-virtual {p1}, Lcom/vkontakte/android/fragments/ProfileFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$OverviewInfoItem;->icon:Landroid/graphics/drawable/Drawable;

    .line 3597
    iput-object p3, p0, Lcom/vkontakte/android/fragments/ProfileFragment$OverviewInfoItem;->text:Ljava/lang/CharSequence;

    .line 3598
    iput-object p4, p0, Lcom/vkontakte/android/fragments/ProfileFragment$OverviewInfoItem;->onClick:Ljava/lang/Runnable;

    .line 3599
    return-void
.end method

.method public constructor <init>(Lcom/vkontakte/android/fragments/ProfileFragment;Landroid/graphics/drawable/Drawable;Ljava/lang/CharSequence;Ljava/lang/Runnable;)V
    .locals 1
    .param p2, "icon"    # Landroid/graphics/drawable/Drawable;
    .param p3, "text"    # Ljava/lang/CharSequence;
    .param p4, "onClick"    # Ljava/lang/Runnable;

    .prologue
    .line 3601
    iput-object p1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$OverviewInfoItem;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/vkontakte/android/fragments/ProfileFragment$InfoItem;-><init>(Lcom/vkontakte/android/fragments/ProfileFragment;Lcom/vkontakte/android/fragments/ProfileFragment$1;)V

    .line 3593
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$OverviewInfoItem;->photos:Ljava/util/ArrayList;

    .line 3602
    iput-object p2, p0, Lcom/vkontakte/android/fragments/ProfileFragment$OverviewInfoItem;->icon:Landroid/graphics/drawable/Drawable;

    .line 3603
    iput-object p3, p0, Lcom/vkontakte/android/fragments/ProfileFragment$OverviewInfoItem;->text:Ljava/lang/CharSequence;

    .line 3604
    iput-object p4, p0, Lcom/vkontakte/android/fragments/ProfileFragment$OverviewInfoItem;->onClick:Ljava/lang/Runnable;

    .line 3605
    return-void
.end method


# virtual methods
.method public createViewHolder()Lcom/vkontakte/android/ui/holder/RecyclerHolder;
    .locals 2

    .prologue
    .line 3614
    new-instance v0, Lcom/vkontakte/android/fragments/ProfileFragment$OverviewInfoViewHolder;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$OverviewInfoItem;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-direct {v0, v1}, Lcom/vkontakte/android/fragments/ProfileFragment$OverviewInfoViewHolder;-><init>(Lcom/vkontakte/android/fragments/ProfileFragment;)V

    return-object v0
.end method

.method public getImageCount()I
    .locals 1

    .prologue
    .line 3619
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$OverviewInfoItem;->photos:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    return v0
.end method

.method public getImageURL(I)Ljava/lang/String;
    .locals 1
    .param p1, "image"    # I

    .prologue
    .line 3624
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$OverviewInfoItem;->photos:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method public getType()I
    .locals 1

    .prologue
    .line 3609
    const/16 v0, -0x17

    return v0
.end method
