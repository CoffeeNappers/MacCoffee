.class Lcom/vk/attachpicker/adapter/AlbumPickSpinnerAdapter$DropDownHolder;
.super Lcom/vk/attachpicker/widget/ViewHolder;
.source "AlbumPickSpinnerAdapter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/attachpicker/adapter/AlbumPickSpinnerAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "DropDownHolder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vk/attachpicker/widget/ViewHolder",
        "<",
        "Lcom/vk/attachpicker/mediastore/AlbumEntry;",
        ">;"
    }
.end annotation


# instance fields
.field private main:Landroid/widget/LinearLayout;

.field private photosCount:Landroid/widget/TextView;

.field final synthetic this$0:Lcom/vk/attachpicker/adapter/AlbumPickSpinnerAdapter;

.field private thumbnailImageView:Lcom/vk/attachpicker/widget/LocalImageView;

.field private title:Landroid/widget/TextView;


# direct methods
.method private constructor <init>(Lcom/vk/attachpicker/adapter/AlbumPickSpinnerAdapter;)V
    .locals 0

    .prologue
    .line 129
    iput-object p1, p0, Lcom/vk/attachpicker/adapter/AlbumPickSpinnerAdapter$DropDownHolder;->this$0:Lcom/vk/attachpicker/adapter/AlbumPickSpinnerAdapter;

    invoke-direct {p0}, Lcom/vk/attachpicker/widget/ViewHolder;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/vk/attachpicker/adapter/AlbumPickSpinnerAdapter;Lcom/vk/attachpicker/adapter/AlbumPickSpinnerAdapter$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/vk/attachpicker/adapter/AlbumPickSpinnerAdapter;
    .param p2, "x1"    # Lcom/vk/attachpicker/adapter/AlbumPickSpinnerAdapter$1;

    .prologue
    .line 129
    invoke-direct {p0, p1}, Lcom/vk/attachpicker/adapter/AlbumPickSpinnerAdapter$DropDownHolder;-><init>(Lcom/vk/attachpicker/adapter/AlbumPickSpinnerAdapter;)V

    return-void
.end method


# virtual methods
.method public clear()V
    .locals 0

    .prologue
    .line 180
    return-void
.end method

.method public initialize(Landroid/content/Context;I)Landroid/view/View;
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "viewType"    # I

    .prologue
    .line 138
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    const v1, 0x7f030191

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    iput-object v0, p0, Lcom/vk/attachpicker/adapter/AlbumPickSpinnerAdapter$DropDownHolder;->main:Landroid/widget/LinearLayout;

    .line 139
    iget-object v0, p0, Lcom/vk/attachpicker/adapter/AlbumPickSpinnerAdapter$DropDownHolder;->main:Landroid/widget/LinearLayout;

    const v1, 0x7f100327

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vk/attachpicker/adapter/AlbumPickSpinnerAdapter$DropDownHolder;->title:Landroid/widget/TextView;

    .line 140
    iget-object v0, p0, Lcom/vk/attachpicker/adapter/AlbumPickSpinnerAdapter$DropDownHolder;->main:Landroid/widget/LinearLayout;

    const v1, 0x7f100463

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vk/attachpicker/adapter/AlbumPickSpinnerAdapter$DropDownHolder;->photosCount:Landroid/widget/TextView;

    .line 141
    iget-object v0, p0, Lcom/vk/attachpicker/adapter/AlbumPickSpinnerAdapter$DropDownHolder;->main:Landroid/widget/LinearLayout;

    const v1, 0x7f100462

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/vk/attachpicker/widget/LocalImageView;

    iput-object v0, p0, Lcom/vk/attachpicker/adapter/AlbumPickSpinnerAdapter$DropDownHolder;->thumbnailImageView:Lcom/vk/attachpicker/widget/LocalImageView;

    .line 142
    iget-object v0, p0, Lcom/vk/attachpicker/adapter/AlbumPickSpinnerAdapter$DropDownHolder;->main:Landroid/widget/LinearLayout;

    return-object v0
.end method

.method public update(Landroid/content/Context;IILcom/vk/attachpicker/mediastore/AlbumEntry;)V
    .locals 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "position"    # I
    .param p3, "viewType"    # I
    .param p4, "data"    # Lcom/vk/attachpicker/mediastore/AlbumEntry;

    .prologue
    const/16 v3, 0x8

    const/4 v2, 0x0

    .line 147
    if-eqz p4, :cond_0

    .line 148
    iget-object v0, p0, Lcom/vk/attachpicker/adapter/AlbumPickSpinnerAdapter$DropDownHolder;->title:Landroid/widget/TextView;

    invoke-virtual {p4}, Lcom/vk/attachpicker/mediastore/AlbumEntry;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 149
    iget-object v0, p0, Lcom/vk/attachpicker/adapter/AlbumPickSpinnerAdapter$DropDownHolder;->photosCount:Landroid/widget/TextView;

    invoke-virtual {p4}, Lcom/vk/attachpicker/mediastore/AlbumEntry;->getImagesCount()I

    move-result v1

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 150
    sget-object v0, Lcom/vk/attachpicker/adapter/AlbumPickSpinnerAdapter;->PHOTO_ENTRY:Lcom/vk/attachpicker/mediastore/AlbumEntry;

    if-ne p4, v0, :cond_2

    .line 151
    iget-object v0, p0, Lcom/vk/attachpicker/adapter/AlbumPickSpinnerAdapter$DropDownHolder;->thumbnailImageView:Lcom/vk/attachpicker/widget/LocalImageView;

    const v1, 0x7f020361

    invoke-virtual {v0, v1}, Lcom/vk/attachpicker/widget/LocalImageView;->setImageResource(I)V

    .line 159
    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/vk/attachpicker/adapter/AlbumPickSpinnerAdapter$DropDownHolder;->this$0:Lcom/vk/attachpicker/adapter/AlbumPickSpinnerAdapter;

    invoke-static {v0}, Lcom/vk/attachpicker/adapter/AlbumPickSpinnerAdapter;->access$100(Lcom/vk/attachpicker/adapter/AlbumPickSpinnerAdapter;)Lcom/vk/attachpicker/widget/CustomSpinner;

    move-result-object v0

    if-eqz v0, :cond_4

    iget-object v0, p0, Lcom/vk/attachpicker/adapter/AlbumPickSpinnerAdapter$DropDownHolder;->this$0:Lcom/vk/attachpicker/adapter/AlbumPickSpinnerAdapter;

    invoke-static {v0}, Lcom/vk/attachpicker/adapter/AlbumPickSpinnerAdapter;->access$100(Lcom/vk/attachpicker/adapter/AlbumPickSpinnerAdapter;)Lcom/vk/attachpicker/widget/CustomSpinner;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vk/attachpicker/widget/CustomSpinner;->getSelectedItemPosition()I

    move-result v0

    if-ne v0, p2, :cond_4

    .line 160
    iget-object v0, p0, Lcom/vk/attachpicker/adapter/AlbumPickSpinnerAdapter$DropDownHolder;->title:Landroid/widget/TextView;

    const v1, -0xae7e48

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 164
    :goto_1
    invoke-virtual {p4}, Lcom/vk/attachpicker/mediastore/AlbumEntry;->getMediaStoreEntry()Lcom/vk/attachpicker/mediastore/MediaStoreEntry;

    move-result-object v0

    if-nez v0, :cond_1

    sget-object v0, Lcom/vk/attachpicker/adapter/AlbumPickSpinnerAdapter;->PHOTO_ENTRY:Lcom/vk/attachpicker/mediastore/AlbumEntry;

    if-eq p4, v0, :cond_1

    sget-object v0, Lcom/vk/attachpicker/adapter/AlbumPickSpinnerAdapter;->VIDEO_ENTRY:Lcom/vk/attachpicker/mediastore/AlbumEntry;

    if-ne p4, v0, :cond_5

    .line 165
    :cond_1
    iget-object v0, p0, Lcom/vk/attachpicker/adapter/AlbumPickSpinnerAdapter$DropDownHolder;->thumbnailImageView:Lcom/vk/attachpicker/widget/LocalImageView;

    invoke-virtual {v0, v2}, Lcom/vk/attachpicker/widget/LocalImageView;->setVisibility(I)V

    .line 169
    :goto_2
    invoke-virtual {p4}, Lcom/vk/attachpicker/mediastore/AlbumEntry;->getImagesCount()I

    move-result v0

    if-nez v0, :cond_6

    .line 170
    iget-object v0, p0, Lcom/vk/attachpicker/adapter/AlbumPickSpinnerAdapter$DropDownHolder;->photosCount:Landroid/widget/TextView;

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setVisibility(I)V

    .line 175
    :goto_3
    return-void

    .line 152
    :cond_2
    sget-object v0, Lcom/vk/attachpicker/adapter/AlbumPickSpinnerAdapter;->VIDEO_ENTRY:Lcom/vk/attachpicker/mediastore/AlbumEntry;

    if-ne p4, v0, :cond_3

    .line 153
    iget-object v0, p0, Lcom/vk/attachpicker/adapter/AlbumPickSpinnerAdapter$DropDownHolder;->thumbnailImageView:Lcom/vk/attachpicker/widget/LocalImageView;

    const v1, 0x7f020362

    invoke-virtual {v0, v1}, Lcom/vk/attachpicker/widget/LocalImageView;->setImageResource(I)V

    goto :goto_0

    .line 155
    :cond_3
    iget-object v0, p0, Lcom/vk/attachpicker/adapter/AlbumPickSpinnerAdapter$DropDownHolder;->thumbnailImageView:Lcom/vk/attachpicker/widget/LocalImageView;

    invoke-virtual {p4}, Lcom/vk/attachpicker/mediastore/AlbumEntry;->getMediaStoreEntry()Lcom/vk/attachpicker/mediastore/MediaStoreEntry;

    move-result-object v1

    invoke-virtual {v0, v1, v2}, Lcom/vk/attachpicker/widget/LocalImageView;->setImage(Lcom/vk/attachpicker/mediastore/MediaStoreEntry;Z)V

    goto :goto_0

    .line 162
    :cond_4
    iget-object v0, p0, Lcom/vk/attachpicker/adapter/AlbumPickSpinnerAdapter$DropDownHolder;->title:Landroid/widget/TextView;

    const v1, -0xd1cfcd

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    goto :goto_1

    .line 167
    :cond_5
    iget-object v0, p0, Lcom/vk/attachpicker/adapter/AlbumPickSpinnerAdapter$DropDownHolder;->thumbnailImageView:Lcom/vk/attachpicker/widget/LocalImageView;

    invoke-virtual {v0, v3}, Lcom/vk/attachpicker/widget/LocalImageView;->setVisibility(I)V

    goto :goto_2

    .line 172
    :cond_6
    iget-object v0, p0, Lcom/vk/attachpicker/adapter/AlbumPickSpinnerAdapter$DropDownHolder;->photosCount:Landroid/widget/TextView;

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_3
.end method

.method public bridge synthetic update(Landroid/content/Context;IILjava/lang/Object;)V
    .locals 0

    .prologue
    .line 129
    check-cast p4, Lcom/vk/attachpicker/mediastore/AlbumEntry;

    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/vk/attachpicker/adapter/AlbumPickSpinnerAdapter$DropDownHolder;->update(Landroid/content/Context;IILcom/vk/attachpicker/mediastore/AlbumEntry;)V

    return-void
.end method
