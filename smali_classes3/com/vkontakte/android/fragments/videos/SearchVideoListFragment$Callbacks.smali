.class Lcom/vkontakte/android/fragments/videos/SearchVideoListFragment$Callbacks;
.super Ljava/lang/Object;
.source "SearchVideoListFragment.java"

# interfaces
.implements Lcom/vkontakte/android/functions/VoidFloat;
.implements Lcom/vkontakte/android/functions/VoidFBool;
.implements Landroid/widget/CompoundButton$OnCheckedChangeListener;
.implements Landroid/widget/AdapterView$OnItemSelectedListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/videos/SearchVideoListFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "Callbacks"
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/videos/SearchVideoListFragment;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/fragments/videos/SearchVideoListFragment;)V
    .locals 0

    .prologue
    .line 150
    iput-object p1, p0, Lcom/vkontakte/android/fragments/videos/SearchVideoListFragment$Callbacks;->this$0:Lcom/vkontakte/android/fragments/videos/SearchVideoListFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/vkontakte/android/fragments/videos/SearchVideoListFragment;Lcom/vkontakte/android/fragments/videos/SearchVideoListFragment$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/vkontakte/android/fragments/videos/SearchVideoListFragment;
    .param p2, "x1"    # Lcom/vkontakte/android/fragments/videos/SearchVideoListFragment$1;

    .prologue
    .line 150
    invoke-direct {p0, p1}, Lcom/vkontakte/android/fragments/videos/SearchVideoListFragment$Callbacks;-><init>(Lcom/vkontakte/android/fragments/videos/SearchVideoListFragment;)V

    return-void
.end method


# virtual methods
.method public f(F)V
    .locals 2
    .param p1, "percent"    # F

    .prologue
    .line 163
    iget-object v0, p0, Lcom/vkontakte/android/fragments/videos/SearchVideoListFragment$Callbacks;->this$0:Lcom/vkontakte/android/fragments/videos/SearchVideoListFragment;

    iget-object v0, v0, Lcom/vkontakte/android/fragments/videos/SearchVideoListFragment;->mSearchIcon:Landroid/view/View;

    const/high16 v1, 0x43340000    # 180.0f

    mul-float/2addr v1, p1

    invoke-virtual {v0, v1}, Landroid/view/View;->setRotation(F)V

    .line 164
    return-void
.end method

.method public f(Z)V
    .locals 2
    .param p1, "opened"    # Z

    .prologue
    .line 155
    iget-object v0, p0, Lcom/vkontakte/android/fragments/videos/SearchVideoListFragment$Callbacks;->this$0:Lcom/vkontakte/android/fragments/videos/SearchVideoListFragment;

    iget-boolean v0, v0, Lcom/vkontakte/android/fragments/videos/SearchVideoListFragment;->mChanged:Z

    if-eqz v0, :cond_0

    if-nez p1, :cond_0

    .line 156
    iget-object v0, p0, Lcom/vkontakte/android/fragments/videos/SearchVideoListFragment$Callbacks;->this$0:Lcom/vkontakte/android/fragments/videos/SearchVideoListFragment;

    const/4 v1, 0x0

    iput-boolean v1, v0, Lcom/vkontakte/android/fragments/videos/SearchVideoListFragment;->mChanged:Z

    .line 157
    iget-object v0, p0, Lcom/vkontakte/android/fragments/videos/SearchVideoListFragment$Callbacks;->this$0:Lcom/vkontakte/android/fragments/videos/SearchVideoListFragment;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/videos/SearchVideoListFragment;->reload()V

    .line 159
    :cond_0
    return-void
.end method

.method public onCheckedChanged(Landroid/widget/CompoundButton;Z)V
    .locals 2
    .param p1, "buttonView"    # Landroid/widget/CompoundButton;
    .param p2, "isChecked"    # Z

    .prologue
    const/4 v1, 0x1

    .line 168
    invoke-virtual {p1}, Landroid/widget/CompoundButton;->getId()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 184
    :cond_0
    :goto_0
    return-void

    .line 170
    :pswitch_0
    iget-object v0, p0, Lcom/vkontakte/android/fragments/videos/SearchVideoListFragment$Callbacks;->this$0:Lcom/vkontakte/android/fragments/videos/SearchVideoListFragment;

    iget-boolean v0, v0, Lcom/vkontakte/android/fragments/videos/SearchVideoListFragment;->mHd:Z

    if-eq v0, p2, :cond_0

    .line 171
    iget-object v0, p0, Lcom/vkontakte/android/fragments/videos/SearchVideoListFragment$Callbacks;->this$0:Lcom/vkontakte/android/fragments/videos/SearchVideoListFragment;

    iput-boolean p2, v0, Lcom/vkontakte/android/fragments/videos/SearchVideoListFragment;->mHd:Z

    .line 172
    iget-object v0, p0, Lcom/vkontakte/android/fragments/videos/SearchVideoListFragment$Callbacks;->this$0:Lcom/vkontakte/android/fragments/videos/SearchVideoListFragment;

    iput-boolean v1, v0, Lcom/vkontakte/android/fragments/videos/SearchVideoListFragment;->mChanged:Z

    goto :goto_0

    .line 177
    :pswitch_1
    iget-object v0, p0, Lcom/vkontakte/android/fragments/videos/SearchVideoListFragment$Callbacks;->this$0:Lcom/vkontakte/android/fragments/videos/SearchVideoListFragment;

    iget-boolean v0, v0, Lcom/vkontakte/android/fragments/videos/SearchVideoListFragment;->mSafeSearch:Z

    if-eq v0, p2, :cond_0

    .line 178
    iget-object v0, p0, Lcom/vkontakte/android/fragments/videos/SearchVideoListFragment$Callbacks;->this$0:Lcom/vkontakte/android/fragments/videos/SearchVideoListFragment;

    iput-boolean p2, v0, Lcom/vkontakte/android/fragments/videos/SearchVideoListFragment;->mSafeSearch:Z

    .line 179
    iget-object v0, p0, Lcom/vkontakte/android/fragments/videos/SearchVideoListFragment$Callbacks;->this$0:Lcom/vkontakte/android/fragments/videos/SearchVideoListFragment;

    iput-boolean v1, v0, Lcom/vkontakte/android/fragments/videos/SearchVideoListFragment;->mChanged:Z

    goto :goto_0

    .line 168
    nop

    :pswitch_data_0
    .packed-switch 0x7f100596
        :pswitch_0
        :pswitch_1
    .end packed-switch
.end method

.method public onItemSelected(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .locals 3
    .param p2, "view"    # Landroid/view/View;
    .param p3, "position"    # I
    .param p4, "id"    # J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView",
            "<*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    .prologue
    .local p1, "parent":Landroid/widget/AdapterView;, "Landroid/widget/AdapterView<*>;"
    const/4 v2, 0x1

    .line 188
    invoke-virtual {p1}, Landroid/widget/AdapterView;->getId()I

    move-result v1

    packed-switch v1, :pswitch_data_0

    .line 206
    :cond_0
    :goto_0
    return-void

    .line 190
    :pswitch_0
    iget-object v1, p0, Lcom/vkontakte/android/fragments/videos/SearchVideoListFragment$Callbacks;->this$0:Lcom/vkontakte/android/fragments/videos/SearchVideoListFragment;

    iget v1, v1, Lcom/vkontakte/android/fragments/videos/SearchVideoListFragment;->mVideoLength:I

    if-eq v1, p3, :cond_0

    .line 191
    iget-object v1, p0, Lcom/vkontakte/android/fragments/videos/SearchVideoListFragment$Callbacks;->this$0:Lcom/vkontakte/android/fragments/videos/SearchVideoListFragment;

    iput p3, v1, Lcom/vkontakte/android/fragments/videos/SearchVideoListFragment;->mVideoLength:I

    .line 192
    iget-object v1, p0, Lcom/vkontakte/android/fragments/videos/SearchVideoListFragment$Callbacks;->this$0:Lcom/vkontakte/android/fragments/videos/SearchVideoListFragment;

    iput-boolean v2, v1, Lcom/vkontakte/android/fragments/videos/SearchVideoListFragment;->mChanged:Z

    goto :goto_0

    .line 197
    :pswitch_1
    const/4 v1, 0x3

    new-array v0, v1, [I

    fill-array-data v0, :array_0

    .line 198
    .local v0, "map":[I
    aget p3, v0, p3

    .line 199
    iget-object v1, p0, Lcom/vkontakte/android/fragments/videos/SearchVideoListFragment$Callbacks;->this$0:Lcom/vkontakte/android/fragments/videos/SearchVideoListFragment;

    iget v1, v1, Lcom/vkontakte/android/fragments/videos/SearchVideoListFragment;->mSortMode:I

    if-eq p3, v1, :cond_0

    .line 200
    iget-object v1, p0, Lcom/vkontakte/android/fragments/videos/SearchVideoListFragment$Callbacks;->this$0:Lcom/vkontakte/android/fragments/videos/SearchVideoListFragment;

    iput p3, v1, Lcom/vkontakte/android/fragments/videos/SearchVideoListFragment;->mSortMode:I

    .line 201
    iget-object v1, p0, Lcom/vkontakte/android/fragments/videos/SearchVideoListFragment$Callbacks;->this$0:Lcom/vkontakte/android/fragments/videos/SearchVideoListFragment;

    iput-boolean v2, v1, Lcom/vkontakte/android/fragments/videos/SearchVideoListFragment;->mChanged:Z

    goto :goto_0

    .line 188
    nop

    :pswitch_data_0
    .packed-switch 0x7f100594
        :pswitch_0
        :pswitch_1
    .end packed-switch

    .line 197
    :array_0
    .array-data 4
        0x2
        0x0
        0x1
    .end array-data
.end method

.method public onNothingSelected(Landroid/widget/AdapterView;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView",
            "<*>;)V"
        }
    .end annotation

    .prologue
    .line 211
    .local p1, "parent":Landroid/widget/AdapterView;, "Landroid/widget/AdapterView<*>;"
    return-void
.end method
