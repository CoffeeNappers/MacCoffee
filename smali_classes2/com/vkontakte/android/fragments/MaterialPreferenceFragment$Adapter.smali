.class Lcom/vkontakte/android/fragments/MaterialPreferenceFragment$Adapter;
.super Lcom/vkontakte/android/ui/adapters/RecyclerWrapperAdapter;
.source "MaterialPreferenceFragment.java"

# interfaces
.implements Lcom/vkontakte/android/ui/CardItemDecorator$Provider;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/MaterialPreferenceFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "Adapter"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/MaterialPreferenceFragment;


# direct methods
.method public constructor <init>(Lcom/vkontakte/android/fragments/MaterialPreferenceFragment;Landroid/support/v7/widget/RecyclerView$Adapter;)V
    .locals 0
    .param p2, "wrappedAdapter"    # Landroid/support/v7/widget/RecyclerView$Adapter;

    .prologue
    .line 148
    iput-object p1, p0, Lcom/vkontakte/android/fragments/MaterialPreferenceFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/MaterialPreferenceFragment;

    .line 149
    invoke-direct {p0, p2}, Lcom/vkontakte/android/ui/adapters/RecyclerWrapperAdapter;-><init>(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    .line 150
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/MaterialPreferenceFragment$Adapter;->findPositionToHighlight()V

    .line 151
    return-void
.end method

.method private findPositionToHighlight()V
    .locals 4

    .prologue
    .line 154
    iget-object v2, p0, Lcom/vkontakte/android/fragments/MaterialPreferenceFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/MaterialPreferenceFragment;

    invoke-static {v2}, Lcom/vkontakte/android/fragments/MaterialPreferenceFragment;->access$300(Lcom/vkontakte/android/fragments/MaterialPreferenceFragment;)Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_0

    iget-object v2, p0, Lcom/vkontakte/android/fragments/MaterialPreferenceFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/MaterialPreferenceFragment;

    invoke-static {v2}, Lcom/vkontakte/android/fragments/MaterialPreferenceFragment;->access$300(Lcom/vkontakte/android/fragments/MaterialPreferenceFragment;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 165
    :cond_0
    :goto_0
    return-void

    .line 158
    :cond_1
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    iget-object v2, p0, Lcom/vkontakte/android/fragments/MaterialPreferenceFragment$Adapter;->wrappedAdapter:Landroid/support/v7/widget/RecyclerView$Adapter;

    invoke-virtual {v2}, Landroid/support/v7/widget/RecyclerView$Adapter;->getItemCount()I

    move-result v2

    if-ge v0, v2, :cond_0

    .line 159
    iget-object v2, p0, Lcom/vkontakte/android/fragments/MaterialPreferenceFragment$Adapter;->wrappedAdapter:Landroid/support/v7/widget/RecyclerView$Adapter;

    check-cast v2, Landroid/support/v7/preference/PreferenceGroupAdapter;

    invoke-virtual {v2, v0}, Landroid/support/v7/preference/PreferenceGroupAdapter;->getItem(I)Landroid/support/v7/preference/Preference;

    move-result-object v1

    .line 160
    .local v1, "p":Landroid/support/v7/preference/Preference;
    iget-object v2, p0, Lcom/vkontakte/android/fragments/MaterialPreferenceFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/MaterialPreferenceFragment;

    invoke-static {v2}, Lcom/vkontakte/android/fragments/MaterialPreferenceFragment;->access$300(Lcom/vkontakte/android/fragments/MaterialPreferenceFragment;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1}, Landroid/support/v7/preference/Preference;->getKey()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 161
    iget-object v2, p0, Lcom/vkontakte/android/fragments/MaterialPreferenceFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/MaterialPreferenceFragment;

    invoke-static {v2, v0}, Lcom/vkontakte/android/fragments/MaterialPreferenceFragment;->access$102(Lcom/vkontakte/android/fragments/MaterialPreferenceFragment;I)I

    goto :goto_0

    .line 158
    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_1
.end method


# virtual methods
.method public getBlockType(I)I
    .locals 5
    .param p1, "position"    # I

    .prologue
    const/4 v2, 0x2

    const/4 v3, 0x1

    .line 169
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/MaterialPreferenceFragment$Adapter;->getItem(I)Landroid/support/v7/preference/Preference;

    move-result-object v0

    .line 170
    .local v0, "item":Landroid/support/v7/preference/Preference;
    add-int/lit8 v4, p1, 0x1

    invoke-virtual {p0, v4}, Lcom/vkontakte/android/fragments/MaterialPreferenceFragment$Adapter;->getItem(I)Landroid/support/v7/preference/Preference;

    move-result-object v1

    .line 171
    .local v1, "itemNext":Landroid/support/v7/preference/Preference;
    if-nez p1, :cond_1

    iget-object v4, p0, Lcom/vkontakte/android/fragments/MaterialPreferenceFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/MaterialPreferenceFragment;

    iget-boolean v4, v4, Lcom/vkontakte/android/fragments/MaterialPreferenceFragment;->isTablet:Z

    if-eqz v4, :cond_1

    .line 180
    :cond_0
    :goto_0
    return v2

    .line 173
    :cond_1
    if-nez p1, :cond_2

    move v2, v3

    .line 174
    goto :goto_0

    .line 175
    :cond_2
    instance-of v4, v0, Landroid/support/v7/preference/PreferenceCategory;

    if-nez v4, :cond_0

    .line 177
    instance-of v2, v1, Landroid/support/v7/preference/PreferenceCategory;

    if-nez v2, :cond_3

    if-nez v1, :cond_4

    .line 178
    :cond_3
    const/4 v2, 0x4

    goto :goto_0

    :cond_4
    move v2, v3

    .line 180
    goto :goto_0
.end method

.method public getItem(I)Landroid/support/v7/preference/Preference;
    .locals 1
    .param p1, "position"    # I

    .prologue
    .line 185
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/MaterialPreferenceFragment$Adapter;->getItemCount()I

    move-result v0

    if-ge p1, v0, :cond_0

    if-ltz p1, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/fragments/MaterialPreferenceFragment$Adapter;->wrappedAdapter:Landroid/support/v7/widget/RecyclerView$Adapter;

    check-cast v0, Landroid/support/v7/preference/PreferenceGroupAdapter;

    invoke-virtual {v0, p1}, Landroid/support/v7/preference/PreferenceGroupAdapter;->getItem(I)Landroid/support/v7/preference/Preference;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public onBindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V
    .locals 3
    .param p1, "holder"    # Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .param p2, "position"    # I

    .prologue
    .line 190
    invoke-super {p0, p1, p2}, Lcom/vkontakte/android/ui/adapters/RecyclerWrapperAdapter;->onBindViewHolder(Landroid/support/v7/widget/RecyclerView$ViewHolder;I)V

    .line 192
    iget-object v0, p1, Landroid/support/v7/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    .line 193
    .local v0, "itemView":Landroid/view/View;
    iget-object v1, p0, Lcom/vkontakte/android/fragments/MaterialPreferenceFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/MaterialPreferenceFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/MaterialPreferenceFragment;->access$100(Lcom/vkontakte/android/fragments/MaterialPreferenceFragment;)I

    move-result v1

    if-ne p2, v1, :cond_0

    iget-object v1, p0, Lcom/vkontakte/android/fragments/MaterialPreferenceFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/MaterialPreferenceFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/MaterialPreferenceFragment;->access$400(Lcom/vkontakte/android/fragments/MaterialPreferenceFragment;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 194
    invoke-static {v0}, Lcom/vkontakte/android/ui/util/HightlightHelper;->highlight(Landroid/view/View;)V

    .line 195
    iget-object v1, p0, Lcom/vkontakte/android/fragments/MaterialPreferenceFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/MaterialPreferenceFragment;

    const/4 v2, 0x1

    invoke-static {v1, v2}, Lcom/vkontakte/android/fragments/MaterialPreferenceFragment;->access$402(Lcom/vkontakte/android/fragments/MaterialPreferenceFragment;Z)Z

    .line 197
    :cond_0
    return-void
.end method
