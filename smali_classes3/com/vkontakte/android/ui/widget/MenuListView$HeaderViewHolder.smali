.class Lcom/vkontakte/android/ui/widget/MenuListView$HeaderViewHolder;
.super Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;
.source "MenuListView.java"

# interfaces
.implements Lme/grishka/appkit/views/UsableRecyclerView$Clickable;
.implements Lme/grishka/appkit/views/UsableRecyclerView$LongClickable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/ui/widget/MenuListView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "HeaderViewHolder"
.end annotation


# instance fields
.field private blurredPhoto:Lcom/vk/imageloader/view/VKImageView;

.field private name:Landroid/widget/TextView;

.field private padder:Landroid/view/View;

.field private photo:Lcom/vk/imageloader/view/VKImageView;

.field private search2:Landroid/widget/ImageView;

.field private status:Landroid/widget/TextView;

.field final synthetic this$0:Lcom/vkontakte/android/ui/widget/MenuListView;


# direct methods
.method public constructor <init>(Lcom/vkontakte/android/ui/widget/MenuListView;)V
    .locals 5

    .prologue
    .line 1052
    iput-object p1, p0, Lcom/vkontakte/android/ui/widget/MenuListView$HeaderViewHolder;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    .line 1053
    invoke-virtual {p1}, Lcom/vkontakte/android/ui/widget/MenuListView;->getContext()Landroid/content/Context;

    move-result-object v1

    const v2, 0x7f0300ef

    const/4 v3, 0x0

    invoke-static {v1, v2, v3}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    invoke-direct {p0, v1}, Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;-><init>(Landroid/view/View;)V

    .line 1054
    iget-object v1, p0, Lcom/vkontakte/android/ui/widget/MenuListView$HeaderViewHolder;->itemView:Landroid/view/View;

    const v2, 0x7f100199

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/vk/imageloader/view/VKImageView;

    iput-object v1, p0, Lcom/vkontakte/android/ui/widget/MenuListView$HeaderViewHolder;->photo:Lcom/vk/imageloader/view/VKImageView;

    .line 1055
    iget-object v1, p0, Lcom/vkontakte/android/ui/widget/MenuListView$HeaderViewHolder;->itemView:Landroid/view/View;

    const v2, 0x7f100376

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/vk/imageloader/view/VKImageView;

    iput-object v1, p0, Lcom/vkontakte/android/ui/widget/MenuListView$HeaderViewHolder;->blurredPhoto:Lcom/vk/imageloader/view/VKImageView;

    .line 1056
    iget-object v1, p0, Lcom/vkontakte/android/ui/widget/MenuListView$HeaderViewHolder;->itemView:Landroid/view/View;

    const v2, 0x7f10019a

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/vkontakte/android/ui/widget/MenuListView$HeaderViewHolder;->name:Landroid/widget/TextView;

    .line 1057
    iget-object v1, p0, Lcom/vkontakte/android/ui/widget/MenuListView$HeaderViewHolder;->itemView:Landroid/view/View;

    const v2, 0x7f100378

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iput-object v1, p0, Lcom/vkontakte/android/ui/widget/MenuListView$HeaderViewHolder;->status:Landroid/widget/TextView;

    .line 1058
    iget-object v1, p0, Lcom/vkontakte/android/ui/widget/MenuListView$HeaderViewHolder;->itemView:Landroid/view/View;

    const v2, 0x7f100375

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    iput-object v1, p0, Lcom/vkontakte/android/ui/widget/MenuListView$HeaderViewHolder;->padder:Landroid/view/View;

    .line 1059
    invoke-static {}, Lcom/vkontakte/android/ui/widget/MenuListView$HeaderViewHolder$$Lambda$1;->lambdaFactory$()Landroid/view/View$OnClickListener;

    move-result-object v0

    .line 1060
    .local v0, "searchClickListener":Landroid/view/View$OnClickListener;
    iget-object v1, p0, Lcom/vkontakte/android/ui/widget/MenuListView$HeaderViewHolder;->itemView:Landroid/view/View;

    const v2, 0x7f10007f

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 1061
    iget-object v1, p0, Lcom/vkontakte/android/ui/widget/MenuListView$HeaderViewHolder;->itemView:Landroid/view/View;

    const v2, 0x7f100379

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    iput-object v1, p0, Lcom/vkontakte/android/ui/widget/MenuListView$HeaderViewHolder;->search2:Landroid/widget/ImageView;

    .line 1062
    iget-object v1, p0, Lcom/vkontakte/android/ui/widget/MenuListView$HeaderViewHolder;->search2:Landroid/widget/ImageView;

    if-eqz v1, :cond_0

    .line 1063
    iget-object v1, p0, Lcom/vkontakte/android/ui/widget/MenuListView$HeaderViewHolder;->search2:Landroid/widget/ImageView;

    invoke-virtual {v1, v0}, Landroid/widget/ImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 1064
    iget-object v1, p0, Lcom/vkontakte/android/ui/widget/MenuListView$HeaderViewHolder;->search2:Landroid/widget/ImageView;

    new-instance v2, Lcom/vkontakte/android/ui/drawable/RecoloredDrawable;

    invoke-virtual {p1}, Lcom/vkontakte/android/ui/widget/MenuListView;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f0201f7

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    const v4, -0x5b554f

    invoke-direct {v2, v3, v4}, Lcom/vkontakte/android/ui/drawable/RecoloredDrawable;-><init>(Landroid/graphics/drawable/Drawable;I)V

    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 1066
    :cond_0
    invoke-static {p1, p0}, Lcom/vkontakte/android/ui/widget/MenuListView;->access$1802(Lcom/vkontakte/android/ui/widget/MenuListView;Lcom/vkontakte/android/ui/widget/MenuListView$HeaderViewHolder;)Lcom/vkontakte/android/ui/widget/MenuListView$HeaderViewHolder;

    .line 1067
    iget-object v1, p0, Lcom/vkontakte/android/ui/widget/MenuListView$HeaderViewHolder;->blurredPhoto:Lcom/vk/imageloader/view/VKImageView;

    if-eqz v1, :cond_1

    .line 1068
    iget-object v1, p0, Lcom/vkontakte/android/ui/widget/MenuListView$HeaderViewHolder;->blurredPhoto:Lcom/vk/imageloader/view/VKImageView;

    new-instance v2, Lcom/vk/imageloader/transform/BlurPostProcessor;

    invoke-direct {v2}, Lcom/vk/imageloader/transform/BlurPostProcessor;-><init>()V

    invoke-virtual {v1, v2}, Lcom/vk/imageloader/view/VKImageView;->setPostprocessor(Lcom/facebook/imagepipeline/request/BasePostprocessor;)V

    .line 1070
    :cond_1
    return-void
.end method

.method static synthetic access$1100(Lcom/vkontakte/android/ui/widget/MenuListView$HeaderViewHolder;)Lcom/vk/imageloader/view/VKImageView;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/widget/MenuListView$HeaderViewHolder;

    .prologue
    .line 1045
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/MenuListView$HeaderViewHolder;->photo:Lcom/vk/imageloader/view/VKImageView;

    return-object v0
.end method

.method static synthetic access$1200(Lcom/vkontakte/android/ui/widget/MenuListView$HeaderViewHolder;)Landroid/widget/TextView;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/widget/MenuListView$HeaderViewHolder;

    .prologue
    .line 1045
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/MenuListView$HeaderViewHolder;->name:Landroid/widget/TextView;

    return-object v0
.end method

.method static synthetic access$1300(Lcom/vkontakte/android/ui/widget/MenuListView$HeaderViewHolder;)Landroid/widget/TextView;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/widget/MenuListView$HeaderViewHolder;

    .prologue
    .line 1045
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/MenuListView$HeaderViewHolder;->status:Landroid/widget/TextView;

    return-object v0
.end method

.method static synthetic access$1400(Lcom/vkontakte/android/ui/widget/MenuListView$HeaderViewHolder;)Landroid/widget/ImageView;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/widget/MenuListView$HeaderViewHolder;

    .prologue
    .line 1045
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/MenuListView$HeaderViewHolder;->search2:Landroid/widget/ImageView;

    return-object v0
.end method


# virtual methods
.method public bind()V
    .locals 4

    .prologue
    .line 1073
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/MenuListView$HeaderViewHolder;->padder:Landroid/view/View;

    new-instance v1, Landroid/widget/RelativeLayout$LayoutParams;

    const/4 v2, -0x1

    iget-object v3, p0, Lcom/vkontakte/android/ui/widget/MenuListView$HeaderViewHolder;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-static {v3}, Lcom/vkontakte/android/ui/widget/MenuListView;->access$1900(Lcom/vkontakte/android/ui/widget/MenuListView;)I

    move-result v3

    invoke-direct {v1, v2, v3}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 1074
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/MenuListView$HeaderViewHolder;->name:Landroid/widget/TextView;

    iget-object v1, p0, Lcom/vkontakte/android/ui/widget/MenuListView$HeaderViewHolder;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-static {v1}, Lcom/vkontakte/android/ui/widget/MenuListView;->access$300(Lcom/vkontakte/android/ui/widget/MenuListView;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1075
    iget-object v1, p0, Lcom/vkontakte/android/ui/widget/MenuListView$HeaderViewHolder;->status:Landroid/widget/TextView;

    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/MenuListView$HeaderViewHolder;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-static {v0}, Lcom/vkontakte/android/ui/widget/MenuListView;->access$2000(Lcom/vkontakte/android/ui/widget/MenuListView;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/MenuListView$HeaderViewHolder;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-static {v0}, Lcom/vkontakte/android/ui/widget/MenuListView;->access$2000(Lcom/vkontakte/android/ui/widget/MenuListView;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_1

    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/MenuListView$HeaderViewHolder;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-virtual {v0}, Lcom/vkontakte/android/ui/widget/MenuListView;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lcom/vk/emoji/Emoji;->instance(Landroid/content/Context;)Lcom/vk/emoji/Emoji;

    move-result-object v0

    iget-object v2, p0, Lcom/vkontakte/android/ui/widget/MenuListView$HeaderViewHolder;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-static {v2}, Lcom/vkontakte/android/ui/widget/MenuListView;->access$2000(Lcom/vkontakte/android/ui/widget/MenuListView;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/vk/emoji/Emoji;->replaceEmoji(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v0

    :goto_0
    invoke-virtual {v1, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1076
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/MenuListView$HeaderViewHolder;->photo:Lcom/vk/imageloader/view/VKImageView;

    iget-object v1, p0, Lcom/vkontakte/android/ui/widget/MenuListView$HeaderViewHolder;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-static {v1}, Lcom/vkontakte/android/ui/widget/MenuListView;->access$200(Lcom/vkontakte/android/ui/widget/MenuListView;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/imageloader/view/VKImageView;->load(Ljava/lang/String;)V

    .line 1077
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/MenuListView$HeaderViewHolder;->blurredPhoto:Lcom/vk/imageloader/view/VKImageView;

    if-eqz v0, :cond_0

    .line 1078
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/MenuListView$HeaderViewHolder;->blurredPhoto:Lcom/vk/imageloader/view/VKImageView;

    iget-object v1, p0, Lcom/vkontakte/android/ui/widget/MenuListView$HeaderViewHolder;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-static {v1}, Lcom/vkontakte/android/ui/widget/MenuListView;->access$200(Lcom/vkontakte/android/ui/widget/MenuListView;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vk/imageloader/view/VKImageView;->load(Ljava/lang/String;)V

    .line 1080
    :cond_0
    return-void

    .line 1075
    :cond_1
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/MenuListView$HeaderViewHolder;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-virtual {v0}, Lcom/vkontakte/android/ui/widget/MenuListView;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v2, 0x7f08047d

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method

.method public onClick()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 1084
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/MenuListView$HeaderViewHolder;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-static {v0}, Lcom/vkontakte/android/ui/widget/MenuListView;->access$2100(Lcom/vkontakte/android/ui/widget/MenuListView;)Lcom/vkontakte/android/ui/widget/MenuListView$Listener;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 1085
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/MenuListView$HeaderViewHolder;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-static {v0}, Lcom/vkontakte/android/ui/widget/MenuListView;->access$2100(Lcom/vkontakte/android/ui/widget/MenuListView;)Lcom/vkontakte/android/ui/widget/MenuListView$Listener;

    move-result-object v0

    invoke-interface {v0, v1, v1}, Lcom/vkontakte/android/ui/widget/MenuListView$Listener;->onMenuItemSelected(IZ)V

    .line 1087
    :cond_0
    return-void
.end method

.method public onLongClick()Z
    .locals 3

    .prologue
    const/4 v2, 0x1

    .line 1091
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/MenuListView$HeaderViewHolder;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-static {v0}, Lcom/vkontakte/android/ui/widget/MenuListView;->access$2100(Lcom/vkontakte/android/ui/widget/MenuListView;)Lcom/vkontakte/android/ui/widget/MenuListView$Listener;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 1092
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/MenuListView$HeaderViewHolder;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-static {v0}, Lcom/vkontakte/android/ui/widget/MenuListView;->access$2100(Lcom/vkontakte/android/ui/widget/MenuListView;)Lcom/vkontakte/android/ui/widget/MenuListView$Listener;

    move-result-object v0

    const/4 v1, 0x0

    invoke-interface {v0, v1, v2}, Lcom/vkontakte/android/ui/widget/MenuListView$Listener;->onMenuItemSelected(IZ)V

    .line 1094
    :cond_0
    return v2
.end method
