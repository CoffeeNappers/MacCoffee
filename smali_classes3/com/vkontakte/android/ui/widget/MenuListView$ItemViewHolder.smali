.class Lcom/vkontakte/android/ui/widget/MenuListView$ItemViewHolder;
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
    name = "ItemViewHolder"
.end annotation


# instance fields
.field private counter:Landroid/widget/TextView;

.field private icon:Landroid/widget/ImageView;

.field private item:Lcom/vkontakte/android/ui/widget/MenuListView$MenuItem;

.field private overlayCounter:Landroid/widget/TextView;

.field final synthetic this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

.field private title:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Lcom/vkontakte/android/ui/widget/MenuListView;)V
    .locals 3

    .prologue
    .line 1104
    iput-object p1, p0, Lcom/vkontakte/android/ui/widget/MenuListView$ItemViewHolder;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    .line 1105
    invoke-virtual {p1}, Lcom/vkontakte/android/ui/widget/MenuListView;->getContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f0300ec

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    invoke-direct {p0, v0}, Lme/grishka/appkit/views/UsableRecyclerView$ViewHolder;-><init>(Landroid/view/View;)V

    .line 1106
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/MenuListView$ItemViewHolder;->itemView:Landroid/view/View;

    const v1, 0x7f100370

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/ui/widget/MenuListView$ItemViewHolder;->title:Landroid/widget/TextView;

    .line 1107
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/MenuListView$ItemViewHolder;->itemView:Landroid/view/View;

    const v1, 0x7f100371

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/ui/widget/MenuListView$ItemViewHolder;->counter:Landroid/widget/TextView;

    .line 1108
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/MenuListView$ItemViewHolder;->itemView:Landroid/view/View;

    const v1, 0x7f100372

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/ui/widget/MenuListView$ItemViewHolder;->overlayCounter:Landroid/widget/TextView;

    .line 1109
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/MenuListView$ItemViewHolder;->itemView:Landroid/view/View;

    const v1, 0x7f10036f

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/ImageView;

    iput-object v0, p0, Lcom/vkontakte/android/ui/widget/MenuListView$ItemViewHolder;->icon:Landroid/widget/ImageView;

    .line 1110
    invoke-static {p1}, Lcom/vkontakte/android/ui/widget/MenuListView;->access$2200(Lcom/vkontakte/android/ui/widget/MenuListView;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1111
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/MenuListView$ItemViewHolder;->itemView:Landroid/view/View;

    new-instance v1, Lcom/vkontakte/android/ui/TabletDrawerItemBackgroundDrawable;

    const/high16 v2, 0x434c0000    # 204.0f

    invoke-static {v2}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v2

    invoke-direct {v1, v2}, Lcom/vkontakte/android/ui/TabletDrawerItemBackgroundDrawable;-><init>(I)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 1113
    :cond_0
    return-void
.end method


# virtual methods
.method public applyExpansion()V
    .locals 6

    .prologue
    const/high16 v5, 0x3f800000    # 1.0f

    .line 1193
    iget-object v2, p0, Lcom/vkontakte/android/ui/widget/MenuListView$ItemViewHolder;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-static {v2}, Lcom/vkontakte/android/ui/widget/MenuListView;->access$1700(Lcom/vkontakte/android/ui/widget/MenuListView;)F

    move-result v2

    const v3, 0x3e4ccccd    # 0.2f

    div-float/2addr v2, v3

    invoke-static {v5, v2}, Ljava/lang/Math;->min(FF)F

    move-result v2

    sub-float v0, v5, v2

    .line 1194
    .local v0, "countersAlpha":F
    const/4 v2, 0x0

    iget-object v3, p0, Lcom/vkontakte/android/ui/widget/MenuListView$ItemViewHolder;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-static {v3}, Lcom/vkontakte/android/ui/widget/MenuListView;->access$1700(Lcom/vkontakte/android/ui/widget/MenuListView;)F

    move-result v3

    const v4, 0x3e99999a    # 0.3f

    sub-float/2addr v3, v4

    invoke-static {v2, v3}, Ljava/lang/Math;->max(FF)F

    move-result v2

    const v3, 0x3f333333    # 0.7f

    div-float v1, v2, v3

    .line 1195
    .local v1, "titlesAlpha":F
    iget-object v2, p0, Lcom/vkontakte/android/ui/widget/MenuListView$ItemViewHolder;->overlayCounter:Landroid/widget/TextView;

    invoke-virtual {v2, v0}, Landroid/widget/TextView;->setAlpha(F)V

    .line 1196
    iget-object v2, p0, Lcom/vkontakte/android/ui/widget/MenuListView$ItemViewHolder;->title:Landroid/widget/TextView;

    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setAlpha(F)V

    .line 1197
    iget-object v2, p0, Lcom/vkontakte/android/ui/widget/MenuListView$ItemViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 1198
    iget-object v2, p0, Lcom/vkontakte/android/ui/widget/MenuListView$ItemViewHolder;->itemView:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v2

    iget-object v3, p0, Lcom/vkontakte/android/ui/widget/MenuListView$ItemViewHolder;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-static {v3}, Lcom/vkontakte/android/ui/widget/MenuListView;->access$1700(Lcom/vkontakte/android/ui/widget/MenuListView;)F

    move-result v3

    sub-float v3, v5, v3

    const v4, 0x461c4000    # 10000.0f

    mul-float/2addr v3, v4

    float-to-int v3, v3

    invoke-virtual {v2, v3}, Landroid/graphics/drawable/Drawable;->setLevel(I)Z

    .line 1200
    :cond_0
    return-void
.end method

.method public bind(Lcom/vkontakte/android/ui/widget/MenuListView$MenuItem;)V
    .locals 10
    .param p1, "item"    # Lcom/vkontakte/android/ui/widget/MenuListView$MenuItem;

    .prologue
    const/16 v9, 0x8

    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 1116
    iput-object p1, p0, Lcom/vkontakte/android/ui/widget/MenuListView$ItemViewHolder;->item:Lcom/vkontakte/android/ui/widget/MenuListView$MenuItem;

    .line 1117
    iget-object v4, p0, Lcom/vkontakte/android/ui/widget/MenuListView$ItemViewHolder;->title:Landroid/widget/TextView;

    iget-object v5, p1, Lcom/vkontakte/android/ui/widget/MenuListView$MenuItem;->title:Ljava/lang/String;

    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1118
    iget-object v4, p0, Lcom/vkontakte/android/ui/widget/MenuListView$ItemViewHolder;->icon:Landroid/widget/ImageView;

    new-instance v5, Lcom/vkontakte/android/ui/drawable/RecoloredDrawable;

    iget-object v6, p0, Lcom/vkontakte/android/ui/widget/MenuListView$ItemViewHolder;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-virtual {v6}, Lcom/vkontakte/android/ui/widget/MenuListView;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    iget v7, p1, Lcom/vkontakte/android/ui/widget/MenuListView$MenuItem;->icon:I

    invoke-virtual {v6, v7}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v6

    iget-object v7, p0, Lcom/vkontakte/android/ui/widget/MenuListView$ItemViewHolder;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-virtual {v7}, Lcom/vkontakte/android/ui/widget/MenuListView;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    const v8, 0x7f0f0119

    invoke-virtual {v7, v8}, Landroid/content/res/Resources;->getColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object v7

    invoke-direct {v5, v6, v7}, Lcom/vkontakte/android/ui/drawable/RecoloredDrawable;-><init>(Landroid/graphics/drawable/Drawable;Landroid/content/res/ColorStateList;)V

    invoke-virtual {v4, v5}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 1121
    iget v4, p1, Lcom/vkontakte/android/ui/widget/MenuListView$MenuItem;->index:I

    packed-switch v4, :pswitch_data_0

    .line 1144
    :pswitch_0
    const/4 v0, 0x0

    .line 1147
    .local v0, "count":I
    :goto_0
    if-nez v0, :cond_2

    .line 1148
    iget-object v4, p0, Lcom/vkontakte/android/ui/widget/MenuListView$ItemViewHolder;->counter:Landroid/widget/TextView;

    invoke-virtual {v4, v9}, Landroid/widget/TextView;->setVisibility(I)V

    .line 1149
    iget-object v4, p0, Lcom/vkontakte/android/ui/widget/MenuListView$ItemViewHolder;->overlayCounter:Landroid/widget/TextView;

    if-eqz v4, :cond_0

    .line 1150
    iget-object v4, p0, Lcom/vkontakte/android/ui/widget/MenuListView$ItemViewHolder;->overlayCounter:Landroid/widget/TextView;

    invoke-virtual {v4, v9}, Landroid/widget/TextView;->setVisibility(I)V

    .line 1171
    :cond_0
    :goto_1
    iget-object v4, p0, Lcom/vkontakte/android/ui/widget/MenuListView$ItemViewHolder;->itemView:Landroid/view/View;

    iget-object v5, p0, Lcom/vkontakte/android/ui/widget/MenuListView$ItemViewHolder;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-static {v5}, Lcom/vkontakte/android/ui/widget/MenuListView;->access$2300(Lcom/vkontakte/android/ui/widget/MenuListView;)I

    move-result v5

    iget v6, p1, Lcom/vkontakte/android/ui/widget/MenuListView$MenuItem;->index:I

    add-int/lit8 v6, v6, 0x1

    if-ne v5, v6, :cond_6

    :goto_2
    invoke-virtual {v4, v2}, Landroid/view/View;->setSelected(Z)V

    .line 1172
    iget-object v2, p0, Lcom/vkontakte/android/ui/widget/MenuListView$ItemViewHolder;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-static {v2}, Lcom/vkontakte/android/ui/widget/MenuListView;->access$2200(Lcom/vkontakte/android/ui/widget/MenuListView;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 1173
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/widget/MenuListView$ItemViewHolder;->applyExpansion()V

    .line 1175
    :cond_1
    return-void

    .line 1123
    .end local v0    # "count":I
    :pswitch_1
    invoke-static {}, Lcom/vkontakte/android/LongPollService;->getNumFriendRequests()I

    move-result v0

    .line 1124
    .restart local v0    # "count":I
    goto :goto_0

    .line 1126
    .end local v0    # "count":I
    :pswitch_2
    invoke-static {}, Lcom/vkontakte/android/LongPollService;->getNumPhotosMarks()I

    move-result v0

    .line 1127
    .restart local v0    # "count":I
    goto :goto_0

    .line 1129
    .end local v0    # "count":I
    :pswitch_3
    invoke-static {}, Lcom/vkontakte/android/LongPollService;->getNumVideosMarks()I

    move-result v0

    .line 1130
    .restart local v0    # "count":I
    goto :goto_0

    .line 1132
    .end local v0    # "count":I
    :pswitch_4
    invoke-static {}, Lcom/vkontakte/android/LongPollService;->getNumNewMessages()I

    move-result v0

    .line 1133
    .restart local v0    # "count":I
    goto :goto_0

    .line 1135
    .end local v0    # "count":I
    :pswitch_5
    invoke-static {}, Lcom/vkontakte/android/LongPollService;->getNumGroupInvitations()I

    move-result v0

    .line 1136
    .restart local v0    # "count":I
    goto :goto_0

    .line 1138
    .end local v0    # "count":I
    :pswitch_6
    invoke-static {}, Lcom/vkontakte/android/LongPollService;->getNumNotifications()I

    move-result v0

    .line 1139
    .restart local v0    # "count":I
    goto :goto_0

    .line 1141
    .end local v0    # "count":I
    :pswitch_7
    invoke-static {}, Lcom/vkontakte/android/LongPollService;->getNumAppRequests()I

    move-result v0

    .line 1142
    .restart local v0    # "count":I
    goto :goto_0

    .line 1153
    :cond_2
    iget-object v4, p0, Lcom/vkontakte/android/ui/widget/MenuListView$ItemViewHolder;->counter:Landroid/widget/TextView;

    invoke-virtual {v4, v3}, Landroid/widget/TextView;->setVisibility(I)V

    .line 1154
    iget-object v4, p0, Lcom/vkontakte/android/ui/widget/MenuListView$ItemViewHolder;->overlayCounter:Landroid/widget/TextView;

    if-eqz v4, :cond_3

    .line 1155
    iget-object v4, p0, Lcom/vkontakte/android/ui/widget/MenuListView$ItemViewHolder;->overlayCounter:Landroid/widget/TextView;

    invoke-virtual {v4, v3}, Landroid/widget/TextView;->setVisibility(I)V

    .line 1158
    :cond_3
    const v4, 0xf4240

    if-le v0, v4, :cond_4

    .line 1160
    const-string/jumbo v4, "%.2fM"

    new-array v5, v2, [Ljava/lang/Object;

    int-to-float v6, v0

    const v7, 0x49742400    # 1000000.0f

    div-float/2addr v6, v7

    invoke-static {v6}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v6

    aput-object v6, v5, v3

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 1166
    .local v1, "text":Ljava/lang/String;
    :goto_3
    iget-object v4, p0, Lcom/vkontakte/android/ui/widget/MenuListView$ItemViewHolder;->counter:Landroid/widget/TextView;

    invoke-virtual {v4, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 1167
    iget-object v4, p0, Lcom/vkontakte/android/ui/widget/MenuListView$ItemViewHolder;->overlayCounter:Landroid/widget/TextView;

    if-eqz v4, :cond_0

    .line 1168
    iget-object v4, p0, Lcom/vkontakte/android/ui/widget/MenuListView$ItemViewHolder;->overlayCounter:Landroid/widget/TextView;

    invoke-virtual {v4, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_1

    .line 1161
    .end local v1    # "text":Ljava/lang/String;
    :cond_4
    const/16 v4, 0x3e8

    if-le v0, v4, :cond_5

    .line 1162
    const-string/jumbo v4, "%.2fK"

    new-array v5, v2, [Ljava/lang/Object;

    int-to-float v6, v0

    const/high16 v7, 0x447a0000    # 1000.0f

    div-float/2addr v6, v7

    invoke-static {v6}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object v6

    aput-object v6, v5, v3

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .restart local v1    # "text":Ljava/lang/String;
    goto :goto_3

    .line 1164
    .end local v1    # "text":Ljava/lang/String;
    :cond_5
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, ""

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .restart local v1    # "text":Ljava/lang/String;
    goto :goto_3

    .end local v1    # "text":Ljava/lang/String;
    :cond_6
    move v2, v3

    .line 1171
    goto/16 :goto_2

    .line 1121
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_6
        :pswitch_4
        :pswitch_1
        :pswitch_5
        :pswitch_2
        :pswitch_3
        :pswitch_0
        :pswitch_7
    .end packed-switch
.end method

.method public onClick()V
    .locals 3

    .prologue
    .line 1179
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/MenuListView$ItemViewHolder;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-static {v0}, Lcom/vkontakte/android/ui/widget/MenuListView;->access$2100(Lcom/vkontakte/android/ui/widget/MenuListView;)Lcom/vkontakte/android/ui/widget/MenuListView$Listener;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 1180
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/MenuListView$ItemViewHolder;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-static {v0}, Lcom/vkontakte/android/ui/widget/MenuListView;->access$2100(Lcom/vkontakte/android/ui/widget/MenuListView;)Lcom/vkontakte/android/ui/widget/MenuListView$Listener;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/ui/widget/MenuListView$ItemViewHolder;->item:Lcom/vkontakte/android/ui/widget/MenuListView$MenuItem;

    iget v1, v1, Lcom/vkontakte/android/ui/widget/MenuListView$MenuItem;->index:I

    add-int/lit8 v1, v1, 0x1

    const/4 v2, 0x0

    invoke-interface {v0, v1, v2}, Lcom/vkontakte/android/ui/widget/MenuListView$Listener;->onMenuItemSelected(IZ)V

    .line 1182
    :cond_0
    return-void
.end method

.method public onLongClick()Z
    .locals 3

    .prologue
    const/4 v2, 0x1

    .line 1186
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/MenuListView$ItemViewHolder;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-static {v0}, Lcom/vkontakte/android/ui/widget/MenuListView;->access$2100(Lcom/vkontakte/android/ui/widget/MenuListView;)Lcom/vkontakte/android/ui/widget/MenuListView$Listener;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 1187
    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/MenuListView$ItemViewHolder;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-static {v0}, Lcom/vkontakte/android/ui/widget/MenuListView;->access$2100(Lcom/vkontakte/android/ui/widget/MenuListView;)Lcom/vkontakte/android/ui/widget/MenuListView$Listener;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/ui/widget/MenuListView$ItemViewHolder;->item:Lcom/vkontakte/android/ui/widget/MenuListView$MenuItem;

    iget v1, v1, Lcom/vkontakte/android/ui/widget/MenuListView$MenuItem;->index:I

    add-int/lit8 v1, v1, 0x1

    invoke-interface {v0, v1, v2}, Lcom/vkontakte/android/ui/widget/MenuListView$Listener;->onMenuItemSelected(IZ)V

    .line 1189
    :cond_0
    return v2
.end method
