.class Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$ImportHolder;
.super Lcom/vkontakte/android/ui/holder/RecyclerHolder;
.source "FriendsImportFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ImportHolder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/ui/holder/RecyclerHolder",
        "<",
        "Lcom/vkontakte/android/fragments/friends/importer/BaseImporter;",
        ">;",
        "Landroid/view/View$OnClickListener;"
    }
.end annotation


# instance fields
.field private final mIcon:Landroid/widget/ImageView;

.field private final mSubtitle:Landroid/widget/TextView;

.field private final mTitle:Landroid/widget/TextView;

.field final synthetic this$0:Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;


# direct methods
.method protected constructor <init>(Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;Landroid/view/ViewGroup;)V
    .locals 1
    .param p2, "parent"    # Landroid/view/ViewGroup;

    .prologue
    .line 362
    iput-object p1, p0, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$ImportHolder;->this$0:Lcom/vkontakte/android/fragments/friends/FriendsImportFragment;

    .line 363
    const v0, 0x7f0300a8

    invoke-direct {p0, v0, p2}, Lcom/vkontakte/android/ui/holder/RecyclerHolder;-><init>(ILandroid/view/ViewGroup;)V

    .line 364
    const v0, 0x7f100128

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$ImportHolder;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$ImportHolder;->mTitle:Landroid/widget/TextView;

    .line 365
    const v0, 0x7f10019c

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$ImportHolder;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$ImportHolder;->mSubtitle:Landroid/widget/TextView;

    .line 366
    const v0, 0x7f100127

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$ImportHolder;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$ImportHolder;->mIcon:Landroid/widget/ImageView;

    .line 367
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$ImportHolder;->itemView:Landroid/view/View;

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 368
    return-void
.end method


# virtual methods
.method public onBind(Lcom/vkontakte/android/fragments/friends/importer/BaseImporter;)V
    .locals 2
    .param p1, "data"    # Lcom/vkontakte/android/fragments/friends/importer/BaseImporter;

    .prologue
    .line 372
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$ImportHolder;->mTitle:Landroid/widget/TextView;

    invoke-virtual {p1}, Lcom/vkontakte/android/fragments/friends/importer/BaseImporter;->getTitle()Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 373
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$ImportHolder;->mSubtitle:Landroid/widget/TextView;

    invoke-virtual {p1}, Lcom/vkontakte/android/fragments/friends/importer/BaseImporter;->getSubtitle()Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 374
    iget-object v0, p0, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$ImportHolder;->mIcon:Landroid/widget/ImageView;

    invoke-virtual {p1}, Lcom/vkontakte/android/fragments/friends/importer/BaseImporter;->getIcon()Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 375
    return-void
.end method

.method public bridge synthetic onBind(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 356
    check-cast p1, Lcom/vkontakte/android/fragments/friends/importer/BaseImporter;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$ImportHolder;->onBind(Lcom/vkontakte/android/fragments/friends/importer/BaseImporter;)V

    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 1
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 379
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$ImportHolder;->getItem()Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 380
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/friends/FriendsImportFragment$ImportHolder;->getItem()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/fragments/friends/importer/BaseImporter;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/friends/importer/BaseImporter;->action()V

    .line 382
    :cond_0
    return-void
.end method
