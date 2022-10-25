.class Lcom/vk/music/view/holders/SectionAudioSpecialHolder$HolderBlock;
.super Ljava/lang/Object;
.source "SectionAudioSpecialHolder.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/music/view/holders/SectionAudioSpecialHolder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "HolderBlock"
.end annotation


# instance fields
.field final DP_24:I

.field final DP_360:I

.field final borderMaxStart:I

.field final borderMiddleStart:I

.field final borderMinStart:I

.field final itemView:Landroid/widget/LinearLayout;

.field final recommendedModel:Lcom/vk/music/model/RecommendedModel;

.field final subtitle:Landroid/widget/TextView;

.field final synthetic this$0:Lcom/vk/music/view/holders/SectionAudioSpecialHolder;

.field final title:Landroid/widget/TextView;


# direct methods
.method constructor <init>(Lcom/vk/music/view/holders/SectionAudioSpecialHolder;Landroid/view/ViewGroup;Lcom/vk/music/model/RecommendedModel;)V
    .locals 3
    .param p1    # Lcom/vk/music/view/holders/SectionAudioSpecialHolder;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2, "parent"    # Landroid/view/ViewGroup;
    .param p3, "recommendedModel"    # Lcom/vk/music/model/RecommendedModel;

    .prologue
    .line 154
    iput-object p1, p0, Lcom/vk/music/view/holders/SectionAudioSpecialHolder$HolderBlock;->this$0:Lcom/vk/music/view/holders/SectionAudioSpecialHolder;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 155
    invoke-virtual {p2}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    const v1, 0x7f03014d

    const/4 v2, 0x0

    .line 156
    invoke-virtual {v0, v1, p2, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/LinearLayout;

    iput-object v0, p0, Lcom/vk/music/view/holders/SectionAudioSpecialHolder$HolderBlock;->itemView:Landroid/widget/LinearLayout;

    .line 157
    iget-object v0, p0, Lcom/vk/music/view/holders/SectionAudioSpecialHolder$HolderBlock;->itemView:Landroid/widget/LinearLayout;

    const v1, 0x1020014

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vk/music/view/holders/SectionAudioSpecialHolder$HolderBlock;->title:Landroid/widget/TextView;

    .line 158
    iget-object v0, p0, Lcom/vk/music/view/holders/SectionAudioSpecialHolder$HolderBlock;->itemView:Landroid/widget/LinearLayout;

    const v1, 0x1020015

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vk/music/view/holders/SectionAudioSpecialHolder$HolderBlock;->subtitle:Landroid/widget/TextView;

    .line 159
    iget-object v0, p0, Lcom/vk/music/view/holders/SectionAudioSpecialHolder$HolderBlock;->itemView:Landroid/widget/LinearLayout;

    const v1, 0x1020019

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 161
    iput-object p3, p0, Lcom/vk/music/view/holders/SectionAudioSpecialHolder$HolderBlock;->recommendedModel:Lcom/vk/music/model/RecommendedModel;

    .line 163
    const/high16 v0, 0x41b00000    # 22.0f

    invoke-static {v0}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v0

    iput v0, p0, Lcom/vk/music/view/holders/SectionAudioSpecialHolder$HolderBlock;->borderMinStart:I

    .line 164
    const/high16 v0, 0x42840000    # 66.0f

    invoke-static {v0}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v0

    iput v0, p0, Lcom/vk/music/view/holders/SectionAudioSpecialHolder$HolderBlock;->borderMiddleStart:I

    .line 165
    const/high16 v0, 0x42dc0000    # 110.0f

    invoke-static {v0}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v0

    iput v0, p0, Lcom/vk/music/view/holders/SectionAudioSpecialHolder$HolderBlock;->borderMaxStart:I

    .line 166
    const/high16 v0, 0x41c00000    # 24.0f

    invoke-static {v0}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v0

    iput v0, p0, Lcom/vk/music/view/holders/SectionAudioSpecialHolder$HolderBlock;->DP_24:I

    .line 167
    const/high16 v0, 0x43b40000    # 360.0f

    invoke-static {v0}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v0

    iput v0, p0, Lcom/vk/music/view/holders/SectionAudioSpecialHolder$HolderBlock;->DP_360:I

    .line 169
    iget-object v0, p0, Lcom/vk/music/view/holders/SectionAudioSpecialHolder$HolderBlock;->itemView:Landroid/widget/LinearLayout;

    invoke-virtual {v0, p0}, Landroid/widget/LinearLayout;->setTag(Ljava/lang/Object;)V

    .line 170
    return-void
.end method


# virtual methods
.method getLayoutParams()Landroid/widget/FrameLayout$LayoutParams;
    .locals 3

    .prologue
    .line 178
    new-instance v0, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v1, -0x1

    const/4 v2, -0x2

    invoke-direct {v0, v1, v2}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 179
    .local v0, "lp":Landroid/widget/FrameLayout$LayoutParams;
    const/16 v1, 0x10

    iput v1, v0, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 180
    return-object v0
.end method

.method public onClick(Landroid/view/View;)V
    .locals 3
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 174
    iget-object v1, p0, Lcom/vk/music/view/holders/SectionAudioSpecialHolder$HolderBlock;->recommendedModel:Lcom/vk/music/model/RecommendedModel;

    iget-object v0, p0, Lcom/vk/music/view/holders/SectionAudioSpecialHolder$HolderBlock;->this$0:Lcom/vk/music/view/holders/SectionAudioSpecialHolder;

    invoke-virtual {v0}, Lcom/vk/music/view/holders/SectionAudioSpecialHolder;->getItem()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vk/music/dto/Section;

    const/4 v2, 0x0

    invoke-interface {v1, v0, v2}, Lcom/vk/music/model/RecommendedModel;->playSection(Lcom/vk/music/dto/Section;Lcom/vkontakte/android/audio/MusicTrack;)V

    .line 175
    return-void
.end method

.method setParams(IIZ)V
    .locals 8
    .param p1, "gravity"    # I
    .param p2, "dx"    # I
    .param p3, "isOneThumbs"    # Z

    .prologue
    const/4 v7, 0x0

    .line 184
    iget-object v3, p0, Lcom/vk/music/view/holders/SectionAudioSpecialHolder$HolderBlock;->itemView:Landroid/widget/LinearLayout;

    invoke-virtual {v3, p1}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 185
    iget-object v3, p0, Lcom/vk/music/view/holders/SectionAudioSpecialHolder$HolderBlock;->title:Landroid/widget/TextView;

    invoke-virtual {v3, p1}, Landroid/widget/TextView;->setGravity(I)V

    .line 186
    iget-object v3, p0, Lcom/vk/music/view/holders/SectionAudioSpecialHolder$HolderBlock;->subtitle:Landroid/widget/TextView;

    invoke-virtual {v3, p1}, Landroid/widget/TextView;->setGravity(I)V

    .line 187
    if-eqz p3, :cond_0

    .line 188
    iget-object v3, p0, Lcom/vk/music/view/holders/SectionAudioSpecialHolder$HolderBlock;->itemView:Landroid/widget/LinearLayout;

    iget v4, p0, Lcom/vk/music/view/holders/SectionAudioSpecialHolder$HolderBlock;->DP_24:I

    iget-object v5, p0, Lcom/vk/music/view/holders/SectionAudioSpecialHolder$HolderBlock;->itemView:Landroid/widget/LinearLayout;

    invoke-virtual {v5}, Landroid/widget/LinearLayout;->getPaddingTop()I

    move-result v5

    iget-object v6, p0, Lcom/vk/music/view/holders/SectionAudioSpecialHolder$HolderBlock;->itemView:Landroid/widget/LinearLayout;

    invoke-virtual {v6}, Landroid/widget/LinearLayout;->getPaddingBottom()I

    move-result v6

    invoke-virtual {v3, v4, v5, v7, v6}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 190
    iget v3, p0, Lcom/vk/music/view/holders/SectionAudioSpecialHolder$HolderBlock;->borderMinStart:I

    add-int/2addr v3, p2

    iget v4, p0, Lcom/vk/music/view/holders/SectionAudioSpecialHolder$HolderBlock;->DP_24:I

    add-int v2, v3, v4

    .line 191
    .local v2, "padTitle":I
    iget-object v3, p0, Lcom/vk/music/view/holders/SectionAudioSpecialHolder$HolderBlock;->title:Landroid/widget/TextView;

    iget-object v4, p0, Lcom/vk/music/view/holders/SectionAudioSpecialHolder$HolderBlock;->title:Landroid/widget/TextView;

    invoke-virtual {v4}, Landroid/widget/TextView;->getPaddingTop()I

    move-result v4

    iget-object v5, p0, Lcom/vk/music/view/holders/SectionAudioSpecialHolder$HolderBlock;->title:Landroid/widget/TextView;

    invoke-virtual {v5}, Landroid/widget/TextView;->getPaddingBottom()I

    move-result v5

    invoke-virtual {v3, v7, v4, v2, v5}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 192
    iget-object v3, p0, Lcom/vk/music/view/holders/SectionAudioSpecialHolder$HolderBlock;->title:Landroid/widget/TextView;

    iget v4, p0, Lcom/vk/music/view/holders/SectionAudioSpecialHolder$HolderBlock;->DP_360:I

    add-int/2addr v4, v2

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setMaxWidth(I)V

    .line 194
    iget v3, p0, Lcom/vk/music/view/holders/SectionAudioSpecialHolder$HolderBlock;->borderMiddleStart:I

    add-int/2addr v3, p2

    iget v4, p0, Lcom/vk/music/view/holders/SectionAudioSpecialHolder$HolderBlock;->DP_24:I

    add-int v1, v3, v4

    .line 195
    .local v1, "padSubtitle":I
    iget-object v3, p0, Lcom/vk/music/view/holders/SectionAudioSpecialHolder$HolderBlock;->subtitle:Landroid/widget/TextView;

    iget-object v4, p0, Lcom/vk/music/view/holders/SectionAudioSpecialHolder$HolderBlock;->subtitle:Landroid/widget/TextView;

    invoke-virtual {v4}, Landroid/widget/TextView;->getPaddingTop()I

    move-result v4

    iget-object v5, p0, Lcom/vk/music/view/holders/SectionAudioSpecialHolder$HolderBlock;->subtitle:Landroid/widget/TextView;

    invoke-virtual {v5}, Landroid/widget/TextView;->getPaddingBottom()I

    move-result v5

    invoke-virtual {v3, v7, v4, v1, v5}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 196
    iget-object v3, p0, Lcom/vk/music/view/holders/SectionAudioSpecialHolder$HolderBlock;->title:Landroid/widget/TextView;

    iget v4, p0, Lcom/vk/music/view/holders/SectionAudioSpecialHolder$HolderBlock;->DP_360:I

    add-int/2addr v4, v1

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setMaxWidth(I)V

    .line 207
    .end local v1    # "padSubtitle":I
    .end local v2    # "padTitle":I
    :goto_0
    return-void

    .line 198
    :cond_0
    iget-object v3, p0, Lcom/vk/music/view/holders/SectionAudioSpecialHolder$HolderBlock;->itemView:Landroid/widget/LinearLayout;

    iget-object v4, p0, Lcom/vk/music/view/holders/SectionAudioSpecialHolder$HolderBlock;->itemView:Landroid/widget/LinearLayout;

    invoke-virtual {v4}, Landroid/widget/LinearLayout;->getPaddingTop()I

    move-result v4

    iget-object v5, p0, Lcom/vk/music/view/holders/SectionAudioSpecialHolder$HolderBlock;->itemView:Landroid/widget/LinearLayout;

    invoke-virtual {v5}, Landroid/widget/LinearLayout;->getPaddingBottom()I

    move-result v5

    invoke-virtual {v3, v7, v4, v7, v5}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 199
    iget v3, p0, Lcom/vk/music/view/holders/SectionAudioSpecialHolder$HolderBlock;->borderMaxStart:I

    add-int/2addr v3, p2

    iget v4, p0, Lcom/vk/music/view/holders/SectionAudioSpecialHolder$HolderBlock;->DP_24:I

    add-int v0, v3, v4

    .line 201
    .local v0, "pad":I
    iget-object v3, p0, Lcom/vk/music/view/holders/SectionAudioSpecialHolder$HolderBlock;->title:Landroid/widget/TextView;

    iget-object v4, p0, Lcom/vk/music/view/holders/SectionAudioSpecialHolder$HolderBlock;->title:Landroid/widget/TextView;

    invoke-virtual {v4}, Landroid/widget/TextView;->getPaddingTop()I

    move-result v4

    iget-object v5, p0, Lcom/vk/music/view/holders/SectionAudioSpecialHolder$HolderBlock;->title:Landroid/widget/TextView;

    invoke-virtual {v5}, Landroid/widget/TextView;->getPaddingBottom()I

    move-result v5

    invoke-virtual {v3, v0, v4, v0, v5}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 202
    iget-object v3, p0, Lcom/vk/music/view/holders/SectionAudioSpecialHolder$HolderBlock;->title:Landroid/widget/TextView;

    iget v4, p0, Lcom/vk/music/view/holders/SectionAudioSpecialHolder$HolderBlock;->DP_360:I

    mul-int/lit8 v5, v0, 0x2

    add-int/2addr v4, v5

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setMaxWidth(I)V

    .line 204
    iget-object v3, p0, Lcom/vk/music/view/holders/SectionAudioSpecialHolder$HolderBlock;->subtitle:Landroid/widget/TextView;

    iget-object v4, p0, Lcom/vk/music/view/holders/SectionAudioSpecialHolder$HolderBlock;->subtitle:Landroid/widget/TextView;

    invoke-virtual {v4}, Landroid/widget/TextView;->getPaddingTop()I

    move-result v4

    iget-object v5, p0, Lcom/vk/music/view/holders/SectionAudioSpecialHolder$HolderBlock;->subtitle:Landroid/widget/TextView;

    invoke-virtual {v5}, Landroid/widget/TextView;->getPaddingBottom()I

    move-result v5

    invoke-virtual {v3, v0, v4, v0, v5}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 205
    iget-object v3, p0, Lcom/vk/music/view/holders/SectionAudioSpecialHolder$HolderBlock;->subtitle:Landroid/widget/TextView;

    iget v4, p0, Lcom/vk/music/view/holders/SectionAudioSpecialHolder$HolderBlock;->DP_360:I

    mul-int/lit8 v5, v0, 0x2

    add-int/2addr v4, v5

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setMaxWidth(I)V

    goto :goto_0
.end method
