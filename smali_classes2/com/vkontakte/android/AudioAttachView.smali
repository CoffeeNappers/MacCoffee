.class public Lcom/vkontakte/android/AudioAttachView;
.super Landroid/view/ViewGroup;
.source "AudioAttachView.java"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Landroid/view/View$OnLongClickListener;
.implements Lcom/vkontakte/android/audio/player/PlayerListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/AudioAttachView$AnimatableLayerDrawable;
    }
.end annotation


# instance fields
.field artist:Ljava/lang/String;

.field private canUpdateProgress:Z

.field duration:I

.field id:I

.field isPlaying:Z

.field oid:I

.field private playButton:Landroid/widget/ImageView;

.field public playlist:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/audio/MusicTrack;",
            ">;"
        }
    .end annotation
.end field

.field public playlistPos:I

.field private postInteract:Lcom/vkontakte/android/data/PostInteract;

.field private refer:Ljava/lang/String;

.field private seekbar:Landroid/widget/SeekBar;

.field private text1:Landroid/widget/TextView;

.field private text2:Landroid/widget/TextView;

.field private text3:Landroid/widget/TextView;

.field private timeText:Landroid/widget/TextView;

.field title:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    const/4 v1, 0x0

    .line 69
    invoke-direct {p0, p1}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;)V

    .line 53
    iput-boolean v1, p0, Lcom/vkontakte/android/AudioAttachView;->isPlaying:Z

    .line 54
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vkontakte/android/AudioAttachView;->playlist:Ljava/util/ArrayList;

    .line 55
    iput v1, p0, Lcom/vkontakte/android/AudioAttachView;->playlistPos:I

    .line 59
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vkontakte/android/AudioAttachView;->canUpdateProgress:Z

    .line 60
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/vkontakte/android/AudioAttachView;->refer:Ljava/lang/String;

    .line 70
    invoke-direct {p0}, Lcom/vkontakte/android/AudioAttachView;->init()V

    .line 71
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 2
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "attrs"    # Landroid/util/AttributeSet;

    .prologue
    const/4 v1, 0x0

    .line 74
    invoke-direct {p0, p1, p2}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 53
    iput-boolean v1, p0, Lcom/vkontakte/android/AudioAttachView;->isPlaying:Z

    .line 54
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vkontakte/android/AudioAttachView;->playlist:Ljava/util/ArrayList;

    .line 55
    iput v1, p0, Lcom/vkontakte/android/AudioAttachView;->playlistPos:I

    .line 59
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vkontakte/android/AudioAttachView;->canUpdateProgress:Z

    .line 60
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/vkontakte/android/AudioAttachView;->refer:Ljava/lang/String;

    .line 75
    invoke-direct {p0}, Lcom/vkontakte/android/AudioAttachView;->init()V

    .line 76
    return-void
.end method

.method static synthetic access$000(Lcom/vkontakte/android/AudioAttachView;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/AudioAttachView;

    .prologue
    .line 48
    invoke-direct {p0}, Lcom/vkontakte/android/AudioAttachView;->lockInterceptTouchEvent()V

    return-void
.end method

.method static synthetic access$100(Lcom/vkontakte/android/AudioAttachView;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/AudioAttachView;

    .prologue
    .line 48
    invoke-direct {p0}, Lcom/vkontakte/android/AudioAttachView;->unlockInterceptTouchEvent()V

    return-void
.end method

.method static synthetic access$202(Lcom/vkontakte/android/AudioAttachView;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/AudioAttachView;
    .param p1, "x1"    # Z

    .prologue
    .line 48
    iput-boolean p1, p0, Lcom/vkontakte/android/AudioAttachView;->canUpdateProgress:Z

    return p1
.end method

.method private init()V
    .locals 10

    .prologue
    const/high16 v9, 0x40c00000    # 6.0f

    const/high16 v8, 0x41300000    # 11.0f

    const/4 v1, 0x0

    const/4 v5, 0x1

    .line 80
    invoke-virtual {p0, v1}, Lcom/vkontakte/android/AudioAttachView;->setClipChildren(Z)V

    .line 81
    new-instance v2, Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/vkontakte/android/AudioAttachView;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-direct {v2, v3}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v2, p0, Lcom/vkontakte/android/AudioAttachView;->text1:Landroid/widget/TextView;

    .line 82
    iget-object v2, p0, Lcom/vkontakte/android/AudioAttachView;->text1:Landroid/widget/TextView;

    sget-object v3, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    .line 83
    iget-object v2, p0, Lcom/vkontakte/android/AudioAttachView;->text1:Landroid/widget/TextView;

    invoke-virtual {v2}, Landroid/widget/TextView;->setSingleLine()V

    .line 84
    iget-object v2, p0, Lcom/vkontakte/android/AudioAttachView;->text1:Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/vkontakte/android/AudioAttachView;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f0f0009

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getColor(I)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 85
    iget-object v2, p0, Lcom/vkontakte/android/AudioAttachView;->text1:Landroid/widget/TextView;

    const/high16 v3, 0x41700000    # 15.0f

    invoke-virtual {v2, v5, v3}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 86
    iget-object v2, p0, Lcom/vkontakte/android/AudioAttachView;->text1:Landroid/widget/TextView;

    invoke-virtual {v2, v5}, Landroid/widget/TextView;->setLines(I)V

    .line 87
    iget-object v2, p0, Lcom/vkontakte/android/AudioAttachView;->text1:Landroid/widget/TextView;

    sget-object v3, Lcom/vkontakte/android/ui/Font;->Medium:Lcom/vkontakte/android/ui/Font;

    iget-object v3, v3, Lcom/vkontakte/android/ui/Font;->typeface:Landroid/graphics/Typeface;

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 88
    iget-object v2, p0, Lcom/vkontakte/android/AudioAttachView;->text1:Landroid/widget/TextView;

    invoke-virtual {p0, v2}, Lcom/vkontakte/android/AudioAttachView;->addView(Landroid/view/View;)V

    .line 90
    new-instance v2, Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/vkontakte/android/AudioAttachView;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-direct {v2, v3}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v2, p0, Lcom/vkontakte/android/AudioAttachView;->text2:Landroid/widget/TextView;

    .line 91
    iget-object v2, p0, Lcom/vkontakte/android/AudioAttachView;->text2:Landroid/widget/TextView;

    sget-object v3, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    .line 92
    iget-object v2, p0, Lcom/vkontakte/android/AudioAttachView;->text2:Landroid/widget/TextView;

    invoke-virtual {v2}, Landroid/widget/TextView;->setSingleLine()V

    .line 93
    iget-object v2, p0, Lcom/vkontakte/android/AudioAttachView;->text2:Landroid/widget/TextView;

    const v3, -0x7afffdfb

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 94
    iget-object v2, p0, Lcom/vkontakte/android/AudioAttachView;->text2:Landroid/widget/TextView;

    const/high16 v3, 0x41600000    # 14.0f

    invoke-virtual {v2, v5, v3}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 95
    iget-object v2, p0, Lcom/vkontakte/android/AudioAttachView;->text2:Landroid/widget/TextView;

    invoke-virtual {v2, v5}, Landroid/widget/TextView;->setLines(I)V

    .line 96
    iget-object v2, p0, Lcom/vkontakte/android/AudioAttachView;->text2:Landroid/widget/TextView;

    invoke-virtual {p0, v2}, Lcom/vkontakte/android/AudioAttachView;->addView(Landroid/view/View;)V

    .line 98
    new-instance v2, Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/vkontakte/android/AudioAttachView;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-direct {v2, v3}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v2, p0, Lcom/vkontakte/android/AudioAttachView;->text3:Landroid/widget/TextView;

    .line 99
    iget-object v2, p0, Lcom/vkontakte/android/AudioAttachView;->text3:Landroid/widget/TextView;

    sget-object v3, Landroid/text/TextUtils$TruncateAt;->MARQUEE:Landroid/text/TextUtils$TruncateAt;

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)V

    .line 100
    iget-object v2, p0, Lcom/vkontakte/android/AudioAttachView;->text3:Landroid/widget/TextView;

    invoke-virtual {v2, v5}, Landroid/widget/TextView;->setHorizontalFadingEdgeEnabled(Z)V

    .line 101
    iget-object v2, p0, Lcom/vkontakte/android/AudioAttachView;->text3:Landroid/widget/TextView;

    const/high16 v3, 0x41200000    # 10.0f

    invoke-static {v3}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setFadingEdgeLength(I)V

    .line 102
    iget-object v2, p0, Lcom/vkontakte/android/AudioAttachView;->text3:Landroid/widget/TextView;

    invoke-virtual {v2}, Landroid/widget/TextView;->setSingleLine()V

    .line 103
    iget-object v2, p0, Lcom/vkontakte/android/AudioAttachView;->text3:Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/vkontakte/android/AudioAttachView;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f0f0009

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getColor(I)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 104
    iget-object v2, p0, Lcom/vkontakte/android/AudioAttachView;->text3:Landroid/widget/TextView;

    const/high16 v3, 0x41700000    # 15.0f

    invoke-virtual {v2, v5, v3}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 105
    iget-object v2, p0, Lcom/vkontakte/android/AudioAttachView;->text3:Landroid/widget/TextView;

    invoke-virtual {v2, v5}, Landroid/widget/TextView;->setLines(I)V

    .line 106
    iget-object v2, p0, Lcom/vkontakte/android/AudioAttachView;->text3:Landroid/widget/TextView;

    sget-object v3, Lcom/vkontakte/android/ui/Font;->Medium:Lcom/vkontakte/android/ui/Font;

    iget-object v3, v3, Lcom/vkontakte/android/ui/Font;->typeface:Landroid/graphics/Typeface;

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 107
    iget-object v2, p0, Lcom/vkontakte/android/AudioAttachView;->text3:Landroid/widget/TextView;

    const/16 v3, 0x8

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setVisibility(I)V

    .line 108
    iget-object v2, p0, Lcom/vkontakte/android/AudioAttachView;->text3:Landroid/widget/TextView;

    invoke-virtual {p0, v2}, Lcom/vkontakte/android/AudioAttachView;->addView(Landroid/view/View;)V

    .line 110
    new-instance v2, Landroid/widget/TextView;

    invoke-virtual {p0}, Lcom/vkontakte/android/AudioAttachView;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-direct {v2, v3}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v2, p0, Lcom/vkontakte/android/AudioAttachView;->timeText:Landroid/widget/TextView;

    .line 111
    iget-object v2, p0, Lcom/vkontakte/android/AudioAttachView;->timeText:Landroid/widget/TextView;

    const v3, -0x878686

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 112
    iget-object v2, p0, Lcom/vkontakte/android/AudioAttachView;->timeText:Landroid/widget/TextView;

    const/high16 v3, 0x41400000    # 12.0f

    invoke-virtual {v2, v5, v3}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 113
    iget-object v2, p0, Lcom/vkontakte/android/AudioAttachView;->timeText:Landroid/widget/TextView;

    invoke-virtual {v2}, Landroid/widget/TextView;->setSingleLine()V

    .line 114
    iget-object v2, p0, Lcom/vkontakte/android/AudioAttachView;->timeText:Landroid/widget/TextView;

    invoke-virtual {p0, v2}, Lcom/vkontakte/android/AudioAttachView;->addView(Landroid/view/View;)V

    .line 116
    new-instance v2, Landroid/widget/ImageView;

    invoke-virtual {p0}, Lcom/vkontakte/android/AudioAttachView;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-direct {v2, v3}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    iput-object v2, p0, Lcom/vkontakte/android/AudioAttachView;->playButton:Landroid/widget/ImageView;

    .line 117
    iget-object v2, p0, Lcom/vkontakte/android/AudioAttachView;->playButton:Landroid/widget/ImageView;

    const v3, 0x7f020168

    invoke-virtual {v2, v3}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 118
    iget-object v2, p0, Lcom/vkontakte/android/AudioAttachView;->playButton:Landroid/widget/ImageView;

    invoke-virtual {p0, v2}, Lcom/vkontakte/android/AudioAttachView;->addView(Landroid/view/View;)V

    .line 120
    new-instance v2, Lcom/vkontakte/android/AudioAttachView$1;

    invoke-virtual {p0}, Lcom/vkontakte/android/AudioAttachView;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-direct {v2, p0, v3}, Lcom/vkontakte/android/AudioAttachView$1;-><init>(Lcom/vkontakte/android/AudioAttachView;Landroid/content/Context;)V

    iput-object v2, p0, Lcom/vkontakte/android/AudioAttachView;->seekbar:Landroid/widget/SeekBar;

    .line 135
    iget-object v2, p0, Lcom/vkontakte/android/AudioAttachView;->seekbar:Landroid/widget/SeekBar;

    const/4 v3, 0x0

    invoke-virtual {v2, v5, v3}, Landroid/widget/SeekBar;->setLayerType(ILandroid/graphics/Paint;)V

    .line 136
    iget-object v2, p0, Lcom/vkontakte/android/AudioAttachView;->seekbar:Landroid/widget/SeekBar;

    const/16 v3, 0x64

    invoke-virtual {v2, v3}, Landroid/widget/SeekBar;->setMax(I)V

    .line 137
    iget-object v2, p0, Lcom/vkontakte/android/AudioAttachView;->seekbar:Landroid/widget/SeekBar;

    invoke-virtual {p0}, Lcom/vkontakte/android/AudioAttachView;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f0203a4

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/SeekBar;->setProgressDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 138
    iget-object v2, p0, Lcom/vkontakte/android/AudioAttachView;->seekbar:Landroid/widget/SeekBar;

    invoke-virtual {p0}, Lcom/vkontakte/android/AudioAttachView;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f02006e

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/SeekBar;->setThumb(Landroid/graphics/drawable/Drawable;)V

    .line 139
    iget-object v2, p0, Lcom/vkontakte/android/AudioAttachView;->seekbar:Landroid/widget/SeekBar;

    invoke-static {v8}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v3

    invoke-static {v8}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v4

    invoke-virtual {v2, v3, v1, v4, v1}, Landroid/widget/SeekBar;->setPadding(IIII)V

    .line 140
    iget-object v2, p0, Lcom/vkontakte/android/AudioAttachView;->seekbar:Landroid/widget/SeekBar;

    const/high16 v3, 0x40a00000    # 5.0f

    invoke-static {v3}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/widget/SeekBar;->setMinimumHeight(I)V

    .line 141
    iget-object v2, p0, Lcom/vkontakte/android/AudioAttachView;->seekbar:Landroid/widget/SeekBar;

    invoke-static {v8}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v3

    invoke-virtual {v2, v3}, Landroid/widget/SeekBar;->setThumbOffset(I)V

    .line 142
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x15

    if-lt v2, v3, :cond_0

    .line 143
    iget-object v2, p0, Lcom/vkontakte/android/AudioAttachView;->seekbar:Landroid/widget/SeekBar;

    invoke-virtual {v2, v1}, Landroid/widget/SeekBar;->setClipToOutline(Z)V

    .line 146
    :cond_0
    :try_start_0
    const-class v2, Landroid/widget/ProgressBar;

    const-string/jumbo v3, "mMaxHeight"

    invoke-virtual {v2, v3}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v6

    .line 147
    .local v6, "fld":Ljava/lang/reflect/Field;
    const/4 v2, 0x1

    invoke-virtual {v6, v2}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 148
    iget-object v2, p0, Lcom/vkontakte/android/AudioAttachView;->seekbar:Landroid/widget/SeekBar;

    const/high16 v3, 0x40800000    # 4.0f

    invoke-static {v3}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v6, v2, v3}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 149
    const-class v2, Landroid/widget/ProgressBar;

    const-string/jumbo v3, "mMinHeight"

    invoke-virtual {v2, v3}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v6

    .line 150
    const/4 v2, 0x1

    invoke-virtual {v6, v2}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 151
    iget-object v2, p0, Lcom/vkontakte/android/AudioAttachView;->seekbar:Landroid/widget/SeekBar;

    const/high16 v3, 0x40800000    # 4.0f

    invoke-static {v3}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v6, v2, v3}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 155
    .end local v6    # "fld":Ljava/lang/reflect/Field;
    :goto_0
    iget-object v2, p0, Lcom/vkontakte/android/AudioAttachView;->seekbar:Landroid/widget/SeekBar;

    invoke-virtual {p0, v2}, Lcom/vkontakte/android/AudioAttachView;->addView(Landroid/view/View;)V

    .line 157
    new-instance v0, Lcom/vkontakte/android/AudioAttachView$AnimatableLayerDrawable;

    new-array v2, v5, [Landroid/graphics/drawable/Drawable;

    new-instance v3, Lme/zhanghai/android/materialprogressbar/IndeterminateHorizontalProgressDrawable;

    invoke-virtual {p0}, Lcom/vkontakte/android/AudioAttachView;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-direct {v3, v4}, Lme/zhanghai/android/materialprogressbar/IndeterminateHorizontalProgressDrawable;-><init>(Landroid/content/Context;)V

    aput-object v3, v2, v1

    invoke-direct {v0, p0, v2}, Lcom/vkontakte/android/AudioAttachView$AnimatableLayerDrawable;-><init>(Lcom/vkontakte/android/AudioAttachView;[Landroid/graphics/drawable/Drawable;)V

    .line 158
    .local v0, "layer":Landroid/graphics/drawable/LayerDrawable;
    invoke-static {v9}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v3

    invoke-static {v9}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v5

    move v2, v1

    move v4, v1

    invoke-virtual/range {v0 .. v5}, Landroid/graphics/drawable/LayerDrawable;->setLayerInset(IIIII)V

    .line 159
    iget-object v1, p0, Lcom/vkontakte/android/AudioAttachView;->seekbar:Landroid/widget/SeekBar;

    invoke-virtual {v1, v0}, Landroid/widget/SeekBar;->setIndeterminateDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 161
    iget-object v1, p0, Lcom/vkontakte/android/AudioAttachView;->seekbar:Landroid/widget/SeekBar;

    const/4 v2, 0x4

    invoke-virtual {v1, v2}, Landroid/widget/SeekBar;->setVisibility(I)V

    .line 162
    iget-object v1, p0, Lcom/vkontakte/android/AudioAttachView;->timeText:Landroid/widget/TextView;

    const/16 v2, 0x55

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setGravity(I)V

    .line 163
    return-void

    .line 152
    .end local v0    # "layer":Landroid/graphics/drawable/LayerDrawable;
    :catch_0
    move-exception v7

    .line 153
    .local v7, "x":Ljava/lang/Exception;
    const-string/jumbo v2, "vk"

    invoke-static {v2, v7}, Lcom/vkontakte/android/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method private lockInterceptTouchEvent()V
    .locals 3

    .prologue
    .line 244
    const-string/jumbo v1, "fave"

    iget-object v2, p0, Lcom/vkontakte/android/AudioAttachView;->refer:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 245
    move-object v0, p0

    .line 246
    .local v0, "parent":Landroid/view/ViewParent;
    :cond_0
    invoke-interface {v0}, Landroid/view/ViewParent;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 247
    instance-of v1, v0, Lme/grishka/appkit/views/DisableableViewPager;

    if-eqz v1, :cond_0

    .line 248
    check-cast v0, Lme/grishka/appkit/views/DisableableViewPager;

    .end local v0    # "parent":Landroid/view/ViewParent;
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lme/grishka/appkit/views/DisableableViewPager;->setSwipeEnabled(Z)V

    .line 253
    :cond_1
    return-void
.end method

.method private replaceIcon(I)V
    .locals 1
    .param p1, "resID"    # I

    .prologue
    .line 295
    iget-object v0, p0, Lcom/vkontakte/android/AudioAttachView;->playButton:Landroid/widget/ImageView;

    invoke-virtual {v0, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 296
    return-void
.end method

.method private unlockInterceptTouchEvent()V
    .locals 3

    .prologue
    .line 256
    const-string/jumbo v1, "fave"

    iget-object v2, p0, Lcom/vkontakte/android/AudioAttachView;->refer:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 257
    move-object v0, p0

    .line 258
    .local v0, "parent":Landroid/view/ViewParent;
    :cond_0
    invoke-interface {v0}, Landroid/view/ViewParent;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 259
    instance-of v1, v0, Lme/grishka/appkit/views/DisableableViewPager;

    if-eqz v1, :cond_0

    .line 260
    check-cast v0, Lme/grishka/appkit/views/DisableableViewPager;

    .end local v0    # "parent":Landroid/view/ViewParent;
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lme/grishka/appkit/views/DisableableViewPager;->setSwipeEnabled(Z)V

    .line 265
    :cond_1
    return-void
.end method


# virtual methods
.method public onAttachedToWindow()V
    .locals 1

    .prologue
    .line 166
    invoke-super {p0}, Landroid/view/ViewGroup;->onAttachedToWindow()V

    .line 167
    const/4 v0, 0x1

    invoke-static {p0, v0}, Lcom/vkontakte/android/audio/AudioFacade;->addPlayerListener(Lcom/vkontakte/android/audio/player/PlayerListener;Z)V

    .line 168
    return-void
.end method

.method public onBufferingProgress(Lcom/vkontakte/android/audio/player/TrackInfo;)V
    .locals 5
    .param p1, "trackInfo"    # Lcom/vkontakte/android/audio/player/TrackInfo;

    .prologue
    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 385
    invoke-virtual {p1}, Lcom/vkontakte/android/audio/player/TrackInfo;->getTrack()Lcom/vkontakte/android/audio/player/PlayerTrack;

    move-result-object v0

    .line 386
    .local v0, "track":Lcom/vkontakte/android/audio/player/PlayerTrack;
    if-eqz v0, :cond_1

    iget v1, v0, Lcom/vkontakte/android/audio/player/PlayerTrack;->oid:I

    iget v4, p0, Lcom/vkontakte/android/AudioAttachView;->oid:I

    if-ne v1, v4, :cond_1

    iget v1, v0, Lcom/vkontakte/android/audio/player/PlayerTrack;->aid:I

    iget v4, p0, Lcom/vkontakte/android/AudioAttachView;->id:I

    if-ne v1, v4, :cond_1

    .line 387
    iget-object v1, p0, Lcom/vkontakte/android/AudioAttachView;->seekbar:Landroid/widget/SeekBar;

    invoke-virtual {v1}, Landroid/widget/SeekBar;->isEnabled()Z

    move-result v1

    if-nez v1, :cond_0

    .line 388
    iget-object v4, p0, Lcom/vkontakte/android/AudioAttachView;->seekbar:Landroid/widget/SeekBar;

    invoke-virtual {p1}, Lcom/vkontakte/android/audio/player/TrackInfo;->getDuration()I

    move-result v1

    if-nez v1, :cond_2

    move v1, v2

    :goto_0
    invoke-virtual {v4, v1}, Landroid/widget/SeekBar;->setIndeterminate(Z)V

    .line 389
    iget-object v1, p0, Lcom/vkontakte/android/AudioAttachView;->seekbar:Landroid/widget/SeekBar;

    invoke-virtual {p1}, Lcom/vkontakte/android/audio/player/TrackInfo;->getDuration()I

    move-result v4

    if-eqz v4, :cond_3

    :goto_1
    invoke-virtual {v1, v2}, Landroid/widget/SeekBar;->setEnabled(Z)V

    .line 391
    :cond_0
    iget-object v1, p0, Lcom/vkontakte/android/AudioAttachView;->seekbar:Landroid/widget/SeekBar;

    invoke-virtual {p1}, Lcom/vkontakte/android/audio/player/TrackInfo;->getBufferingPercent()I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/widget/SeekBar;->setSecondaryProgress(I)V

    .line 393
    :cond_1
    return-void

    :cond_2
    move v1, v3

    .line 388
    goto :goto_0

    :cond_3
    move v2, v3

    .line 389
    goto :goto_1
.end method

.method public onClick(Landroid/view/View;)V
    .locals 9
    .param p1, "v"    # Landroid/view/View;

    .prologue
    const/4 v8, 0x1

    .line 269
    iget v1, p0, Lcom/vkontakte/android/AudioAttachView;->oid:I

    iget v2, p0, Lcom/vkontakte/android/AudioAttachView;->id:I

    invoke-static {v1, v2}, Lcom/vkontakte/android/audio/AudioFacade;->isCurrentTrack(II)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 270
    invoke-static {}, Lcom/vkontakte/android/audio/AudioFacade;->toggleResumePause()V

    .line 292
    :cond_0
    :goto_0
    return-void

    .line 272
    :cond_1
    invoke-virtual {p0}, Lcom/vkontakte/android/AudioAttachView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/vkontakte/android/auth/VKAuth;->ensureLoggedIn(Landroid/content/Context;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 275
    iget v1, p0, Lcom/vkontakte/android/AudioAttachView;->oid:I

    iget v2, p0, Lcom/vkontakte/android/AudioAttachView;->id:I

    invoke-static {v1, v2}, Lcom/vkontakte/android/audio/AudioFacade;->isCurrentTrack(II)Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-static {}, Lcom/vkontakte/android/audio/AudioFacade;->getPlayerState()Lcom/vkontakte/android/audio/player/PlayerState;

    move-result-object v1

    sget-object v2, Lcom/vkontakte/android/audio/player/PlayerState;->IDLE:Lcom/vkontakte/android/audio/player/PlayerState;

    if-ne v1, v2, :cond_0

    .line 278
    :cond_2
    iget-object v1, p0, Lcom/vkontakte/android/AudioAttachView;->playlist:Ljava/util/ArrayList;

    if-nez v1, :cond_3

    .line 279
    new-instance v0, Lcom/vkontakte/android/audio/MusicTrack;

    iget v1, p0, Lcom/vkontakte/android/AudioAttachView;->id:I

    iget v2, p0, Lcom/vkontakte/android/AudioAttachView;->oid:I

    iget-object v3, p0, Lcom/vkontakte/android/AudioAttachView;->artist:Ljava/lang/String;

    iget-object v4, p0, Lcom/vkontakte/android/AudioAttachView;->title:Ljava/lang/String;

    iget v5, p0, Lcom/vkontakte/android/AudioAttachView;->duration:I

    const/4 v6, 0x0

    invoke-direct/range {v0 .. v6}, Lcom/vkontakte/android/audio/MusicTrack;-><init>(IILjava/lang/String;Ljava/lang/String;ILjava/lang/String;)V

    .line 280
    .local v0, "af":Lcom/vkontakte/android/audio/MusicTrack;
    iget-object v1, p0, Lcom/vkontakte/android/AudioAttachView;->refer:Ljava/lang/String;

    invoke-static {v1}, Lcom/vkontakte/android/audio/player/PlayerRefer;->parse(Ljava/lang/String;)Lcom/vkontakte/android/audio/player/PlayerRefer;

    move-result-object v1

    invoke-static {v0, v1, v8}, Lcom/vkontakte/android/audio/AudioFacade;->playTrack(Lcom/vkontakte/android/audio/MusicTrack;Lcom/vkontakte/android/audio/player/PlayerRefer;Z)V

    .line 288
    .end local v0    # "af":Lcom/vkontakte/android/audio/MusicTrack;
    :goto_1
    iget-object v1, p0, Lcom/vkontakte/android/AudioAttachView;->postInteract:Lcom/vkontakte/android/data/PostInteract;

    if-eqz v1, :cond_0

    .line 289
    iget-object v1, p0, Lcom/vkontakte/android/AudioAttachView;->postInteract:Lcom/vkontakte/android/data/PostInteract;

    sget-object v2, Lcom/vkontakte/android/data/PostInteract$Type;->audio_start:Lcom/vkontakte/android/data/PostInteract$Type;

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/data/PostInteract;->commit(Lcom/vkontakte/android/data/PostInteract$Type;)V

    goto :goto_0

    .line 282
    :cond_3
    iget-object v1, p0, Lcom/vkontakte/android/AudioAttachView;->playlist:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_4

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lcom/vkontakte/android/audio/MusicTrack;

    .line 283
    .local v7, "file":Lcom/vkontakte/android/audio/MusicTrack;
    iput-boolean v8, v7, Lcom/vkontakte/android/audio/MusicTrack;->fromAttachment:Z

    goto :goto_2

    .line 285
    .end local v7    # "file":Lcom/vkontakte/android/audio/MusicTrack;
    :cond_4
    iget-object v1, p0, Lcom/vkontakte/android/AudioAttachView;->playlist:Ljava/util/ArrayList;

    iget v2, p0, Lcom/vkontakte/android/AudioAttachView;->playlistPos:I

    iget-object v3, p0, Lcom/vkontakte/android/AudioAttachView;->refer:Ljava/lang/String;

    invoke-static {v3}, Lcom/vkontakte/android/audio/player/PlayerRefer;->parse(Ljava/lang/String;)Lcom/vkontakte/android/audio/player/PlayerRefer;

    move-result-object v3

    invoke-static {v1, v2, v3, v8}, Lcom/vkontakte/android/audio/AudioFacade;->playTracks(Ljava/util/Collection;ILcom/vkontakte/android/audio/player/PlayerRefer;Z)V

    goto :goto_1
.end method

.method public onDetachedFromWindow()V
    .locals 0

    .prologue
    .line 171
    invoke-super {p0}, Landroid/view/ViewGroup;->onDetachedFromWindow()V

    .line 172
    invoke-static {p0}, Lcom/vkontakte/android/audio/AudioFacade;->removePlayerListener(Lcom/vkontakte/android/audio/player/PlayerListener;)V

    .line 173
    return-void
.end method

.method public onLayout(ZIIII)V
    .locals 7
    .param p1, "changed"    # Z
    .param p2, "l"    # I
    .param p3, "t"    # I
    .param p4, "r"    # I
    .param p5, "b"    # I

    .prologue
    .line 309
    invoke-virtual {p0}, Lcom/vkontakte/android/AudioAttachView;->getPaddingLeft()I

    move-result v0

    .line 310
    .local v0, "pad":I
    iget-object v1, p0, Lcom/vkontakte/android/AudioAttachView;->playButton:Landroid/widget/ImageView;

    const/high16 v2, 0x41000000    # 8.0f

    invoke-static {v2}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v2

    const/high16 v3, 0x42200000    # 40.0f

    invoke-static {v3}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v3

    add-int/2addr v3, v0

    const/high16 v4, 0x42400000    # 48.0f

    invoke-static {v4}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v4

    invoke-virtual {v1, v0, v2, v3, v4}, Landroid/widget/ImageView;->layout(IIII)V

    .line 311
    iget-object v1, p0, Lcom/vkontakte/android/AudioAttachView;->text1:Landroid/widget/TextView;

    const/high16 v2, 0x42500000    # 52.0f

    invoke-static {v2}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v2

    add-int/2addr v2, v0

    const/high16 v3, 0x41000000    # 8.0f

    invoke-static {v3}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v3

    sub-int v4, p4, p2

    sub-int/2addr v4, v0

    const/high16 v5, 0x41f80000    # 31.0f

    invoke-static {v5}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v5

    invoke-virtual {v1, v2, v3, v4, v5}, Landroid/widget/TextView;->layout(IIII)V

    .line 312
    iget-object v1, p0, Lcom/vkontakte/android/AudioAttachView;->text3:Landroid/widget/TextView;

    const/high16 v2, 0x42500000    # 52.0f

    invoke-static {v2}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v2

    add-int/2addr v2, v0

    const/high16 v3, 0x41000000    # 8.0f

    invoke-static {v3}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v3

    sub-int v4, p4, p2

    sub-int/2addr v4, v0

    const/high16 v5, 0x41f80000    # 31.0f

    invoke-static {v5}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v5

    invoke-virtual {v1, v2, v3, v4, v5}, Landroid/widget/TextView;->layout(IIII)V

    .line 313
    iget-object v1, p0, Lcom/vkontakte/android/AudioAttachView;->text2:Landroid/widget/TextView;

    const/high16 v2, 0x42500000    # 52.0f

    invoke-static {v2}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v2

    add-int/2addr v2, v0

    const/high16 v3, 0x41f80000    # 31.0f

    invoke-static {v3}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v3

    sub-int v4, p4, p2

    const/high16 v5, 0x42480000    # 50.0f

    invoke-static {v5}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v5

    sub-int/2addr v4, v5

    sub-int/2addr v4, v0

    const/high16 v5, 0x42540000    # 53.0f

    invoke-static {v5}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v5

    invoke-virtual {v1, v2, v3, v4, v5}, Landroid/widget/TextView;->layout(IIII)V

    .line 314
    iget-object v1, p0, Lcom/vkontakte/android/AudioAttachView;->timeText:Landroid/widget/TextView;

    const/high16 v2, 0x42200000    # 40.0f

    invoke-static {v2}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v2

    const/high16 v3, 0x40000000    # 2.0f

    invoke-static {v2, v3}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v2

    const/high16 v3, 0x41b00000    # 22.0f

    invoke-static {v3}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v3

    const/high16 v4, 0x40000000    # 2.0f

    invoke-static {v3, v4}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v3

    invoke-virtual {v1, v2, v3}, Landroid/widget/TextView;->measure(II)V

    .line 315
    iget-object v1, p0, Lcom/vkontakte/android/AudioAttachView;->timeText:Landroid/widget/TextView;

    sub-int v2, p4, p2

    sub-int/2addr v2, v0

    const/high16 v3, 0x42200000    # 40.0f

    invoke-static {v3}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v3

    sub-int/2addr v2, v3

    sub-int v3, p5, p3

    const/high16 v4, 0x41f00000    # 30.0f

    invoke-static {v4}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v4

    sub-int/2addr v3, v4

    sub-int v4, p4, p2

    sub-int/2addr v4, v0

    sub-int v5, p5, p3

    const/high16 v6, 0x41000000    # 8.0f

    invoke-static {v6}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v6

    sub-int/2addr v5, v6

    invoke-virtual {v1, v2, v3, v4, v5}, Landroid/widget/TextView;->layout(IIII)V

    .line 316
    iget-object v1, p0, Lcom/vkontakte/android/AudioAttachView;->seekbar:Landroid/widget/SeekBar;

    const/high16 v2, 0x42240000    # 41.0f

    invoke-static {v2}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v2

    add-int/2addr v2, v0

    sub-int v3, p5, p3

    const/high16 v4, 0x41d00000    # 26.0f

    invoke-static {v4}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v4

    sub-int/2addr v3, v4

    sub-int v4, p4, p2

    const/high16 v5, -0x3de40000    # -39.0f

    invoke-static {v5}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v5

    add-int/2addr v4, v5

    sub-int/2addr v4, v0

    sub-int v5, p5, p3

    const/high16 v6, 0x40800000    # 4.0f

    invoke-static {v6}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v6

    sub-int/2addr v5, v6

    invoke-virtual {v1, v2, v3, v4, v5}, Landroid/widget/SeekBar;->layout(IIII)V

    .line 317
    return-void
.end method

.method public onLongClick(Landroid/view/View;)Z
    .locals 9
    .param p1, "v"    # Landroid/view/View;

    .prologue
    const/4 v8, 0x0

    .line 321
    new-instance v0, Lcom/vkontakte/android/audio/MusicTrack;

    iget v1, p0, Lcom/vkontakte/android/AudioAttachView;->id:I

    iget v2, p0, Lcom/vkontakte/android/AudioAttachView;->oid:I

    iget-object v3, p0, Lcom/vkontakte/android/AudioAttachView;->artist:Ljava/lang/String;

    iget-object v4, p0, Lcom/vkontakte/android/AudioAttachView;->title:Ljava/lang/String;

    iget v5, p0, Lcom/vkontakte/android/AudioAttachView;->duration:I

    const/4 v6, 0x0

    invoke-direct/range {v0 .. v6}, Lcom/vkontakte/android/audio/MusicTrack;-><init>(IILjava/lang/String;Ljava/lang/String;ILjava/lang/String;)V

    .line 322
    .local v0, "af":Lcom/vkontakte/android/audio/MusicTrack;
    invoke-static {v0}, Lcom/vkontakte/android/audio/AudioFacade;->enqueue(Lcom/vkontakte/android/audio/MusicTrack;)Z

    move-result v7

    .line 323
    .local v7, "res":Z
    if-nez v7, :cond_0

    move v1, v8

    .line 327
    :goto_0
    return v1

    .line 326
    :cond_0
    invoke-virtual {p0}, Lcom/vkontakte/android/AudioAttachView;->getContext()Landroid/content/Context;

    move-result-object v1

    const v2, 0x7f0800e6

    invoke-static {v1, v2, v8}, Landroid/widget/Toast;->makeText(Landroid/content/Context;II)Landroid/widget/Toast;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/Toast;->show()V

    .line 327
    const/4 v1, 0x1

    goto :goto_0
.end method

.method public onMeasure(II)V
    .locals 2
    .param p1, "w"    # I
    .param p2, "h"    # I

    .prologue
    .line 176
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v0

    const/high16 v1, 0x42600000    # 56.0f

    invoke-static {v1}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v1

    invoke-virtual {p0, v0, v1}, Lcom/vkontakte/android/AudioAttachView;->setMeasuredDimension(II)V

    .line 177
    return-void
.end method

.method public onParametersChanged(Lcom/vkontakte/android/audio/player/Player;)V
    .locals 0
    .param p1, "player"    # Lcom/vkontakte/android/audio/player/Player;

    .prologue
    .line 397
    return-void
.end method

.method public onProgress(Lcom/vkontakte/android/audio/player/TrackInfo;)V
    .locals 8
    .param p1, "trackInfo"    # Lcom/vkontakte/android/audio/player/TrackInfo;

    .prologue
    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 367
    invoke-virtual {p1}, Lcom/vkontakte/android/audio/player/TrackInfo;->getTrack()Lcom/vkontakte/android/audio/player/PlayerTrack;

    move-result-object v1

    .line 368
    .local v1, "track":Lcom/vkontakte/android/audio/player/PlayerTrack;
    if-eqz v1, :cond_2

    iget v2, v1, Lcom/vkontakte/android/audio/player/PlayerTrack;->oid:I

    iget v5, p0, Lcom/vkontakte/android/AudioAttachView;->oid:I

    if-ne v2, v5, :cond_2

    iget v2, v1, Lcom/vkontakte/android/audio/player/PlayerTrack;->aid:I

    iget v5, p0, Lcom/vkontakte/android/AudioAttachView;->id:I

    if-ne v2, v5, :cond_2

    .line 369
    iget-object v2, p0, Lcom/vkontakte/android/AudioAttachView;->seekbar:Landroid/widget/SeekBar;

    invoke-virtual {v2}, Landroid/widget/SeekBar;->isEnabled()Z

    move-result v2

    if-nez v2, :cond_0

    .line 370
    iget-object v5, p0, Lcom/vkontakte/android/AudioAttachView;->seekbar:Landroid/widget/SeekBar;

    invoke-virtual {p1}, Lcom/vkontakte/android/audio/player/TrackInfo;->getDuration()I

    move-result v2

    if-nez v2, :cond_3

    move v2, v3

    :goto_0
    invoke-virtual {v5, v2}, Landroid/widget/SeekBar;->setIndeterminate(Z)V

    .line 371
    iget-object v5, p0, Lcom/vkontakte/android/AudioAttachView;->seekbar:Landroid/widget/SeekBar;

    invoke-virtual {p1}, Lcom/vkontakte/android/audio/player/TrackInfo;->getDuration()I

    move-result v2

    if-eqz v2, :cond_4

    move v2, v3

    :goto_1
    invoke-virtual {v5, v2}, Landroid/widget/SeekBar;->setEnabled(Z)V

    .line 373
    :cond_0
    iget-boolean v2, p0, Lcom/vkontakte/android/AudioAttachView;->canUpdateProgress:Z

    if-eqz v2, :cond_1

    .line 374
    iget-object v2, p0, Lcom/vkontakte/android/AudioAttachView;->seekbar:Landroid/widget/SeekBar;

    invoke-virtual {p1}, Lcom/vkontakte/android/audio/player/TrackInfo;->getPositionPercent()I

    move-result v5

    invoke-virtual {v2, v5}, Landroid/widget/SeekBar;->setProgress(I)V

    .line 376
    :cond_1
    invoke-virtual {p1}, Lcom/vkontakte/android/audio/player/TrackInfo;->getDuration()I

    move-result v2

    if-lez v2, :cond_2

    .line 377
    invoke-virtual {p1}, Lcom/vkontakte/android/audio/player/TrackInfo;->getDuration()I

    move-result v2

    invoke-virtual {p1}, Lcom/vkontakte/android/audio/player/TrackInfo;->getPosition()I

    move-result v5

    sub-int/2addr v2, v5

    div-int/lit16 v0, v2, 0x3e8

    .line 378
    .local v0, "left":I
    iget-object v2, p0, Lcom/vkontakte/android/AudioAttachView;->timeText:Landroid/widget/TextView;

    const-string/jumbo v5, "-%d:%02d"

    const/4 v6, 0x2

    new-array v6, v6, [Ljava/lang/Object;

    div-int/lit8 v7, v0, 0x3c

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    aput-object v7, v6, v4

    rem-int/lit8 v4, v0, 0x3c

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v6, v3

    invoke-static {v5, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 381
    .end local v0    # "left":I
    :cond_2
    return-void

    :cond_3
    move v2, v4

    .line 370
    goto :goto_0

    :cond_4
    move v2, v4

    .line 371
    goto :goto_1
.end method

.method public onStateChanged(Lcom/vkontakte/android/audio/player/PlayerState;Lcom/vkontakte/android/audio/player/TrackInfo;)V
    .locals 7
    .param p1, "state"    # Lcom/vkontakte/android/audio/player/PlayerState;
    .param p2, "trackInfo"    # Lcom/vkontakte/android/audio/player/TrackInfo;

    .prologue
    const/16 v5, 0x8

    const/4 v2, 0x1

    const/4 v3, 0x0

    .line 334
    invoke-virtual {p2}, Lcom/vkontakte/android/audio/player/TrackInfo;->getTrack()Lcom/vkontakte/android/audio/player/PlayerTrack;

    move-result-object v0

    .line 335
    .local v0, "track":Lcom/vkontakte/android/audio/player/PlayerTrack;
    if-eqz v0, :cond_6

    iget v1, v0, Lcom/vkontakte/android/audio/player/PlayerTrack;->oid:I

    iget v4, p0, Lcom/vkontakte/android/AudioAttachView;->oid:I

    if-ne v1, v4, :cond_6

    iget v1, v0, Lcom/vkontakte/android/audio/player/PlayerTrack;->aid:I

    iget v4, p0, Lcom/vkontakte/android/AudioAttachView;->id:I

    if-ne v1, v4, :cond_6

    .line 336
    sget-object v1, Lcom/vkontakte/android/audio/player/PlayerState;->PLAYING:Lcom/vkontakte/android/audio/player/PlayerState;

    if-ne p1, v1, :cond_3

    move v1, v2

    :goto_0
    invoke-virtual {p0, v1}, Lcom/vkontakte/android/AudioAttachView;->setPlaying(Z)V

    .line 337
    iget-object v1, p0, Lcom/vkontakte/android/AudioAttachView;->seekbar:Landroid/widget/SeekBar;

    invoke-static {v1, v3}, Lme/grishka/appkit/utils/V;->setVisibilityAnimated(Landroid/view/View;I)V

    .line 338
    iget-object v1, p0, Lcom/vkontakte/android/AudioAttachView;->text3:Landroid/widget/TextView;

    invoke-static {v1, v3}, Lme/grishka/appkit/utils/V;->setVisibilityAnimated(Landroid/view/View;I)V

    .line 339
    iget-object v1, p0, Lcom/vkontakte/android/AudioAttachView;->text2:Landroid/widget/TextView;

    invoke-static {v1, v5}, Lme/grishka/appkit/utils/V;->setVisibilityAnimated(Landroid/view/View;I)V

    .line 340
    iget-object v1, p0, Lcom/vkontakte/android/AudioAttachView;->text1:Landroid/widget/TextView;

    invoke-static {v1, v5}, Lme/grishka/appkit/utils/V;->setVisibilityAnimated(Landroid/view/View;I)V

    .line 341
    iget-object v1, p0, Lcom/vkontakte/android/AudioAttachView;->text3:Landroid/widget/TextView;

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setSelected(Z)V

    .line 342
    iget-object v4, p0, Lcom/vkontakte/android/AudioAttachView;->seekbar:Landroid/widget/SeekBar;

    invoke-virtual {p2}, Lcom/vkontakte/android/audio/player/TrackInfo;->getDuration()I

    move-result v1

    if-nez v1, :cond_4

    sget-object v1, Lcom/vkontakte/android/audio/player/PlayerState;->PLAYING:Lcom/vkontakte/android/audio/player/PlayerState;

    if-eq p1, v1, :cond_0

    sget-object v1, Lcom/vkontakte/android/audio/player/PlayerState;->PAUSED:Lcom/vkontakte/android/audio/player/PlayerState;

    if-ne p1, v1, :cond_4

    :cond_0
    move v1, v2

    :goto_1
    invoke-virtual {v4, v1}, Landroid/widget/SeekBar;->setIndeterminate(Z)V

    .line 343
    iget-object v1, p0, Lcom/vkontakte/android/AudioAttachView;->seekbar:Landroid/widget/SeekBar;

    invoke-virtual {p2}, Lcom/vkontakte/android/audio/player/TrackInfo;->getDuration()I

    move-result v4

    if-eqz v4, :cond_5

    sget-object v4, Lcom/vkontakte/android/audio/player/PlayerState;->PLAYING:Lcom/vkontakte/android/audio/player/PlayerState;

    if-eq p1, v4, :cond_1

    sget-object v4, Lcom/vkontakte/android/audio/player/PlayerState;->PAUSED:Lcom/vkontakte/android/audio/player/PlayerState;

    if-ne p1, v4, :cond_5

    :cond_1
    :goto_2
    invoke-virtual {v1, v2}, Landroid/widget/SeekBar;->setEnabled(Z)V

    .line 344
    iget-object v1, p0, Lcom/vkontakte/android/AudioAttachView;->seekbar:Landroid/widget/SeekBar;

    invoke-virtual {v1, v3}, Landroid/widget/SeekBar;->setFocusable(Z)V

    .line 345
    iget-object v1, p0, Lcom/vkontakte/android/AudioAttachView;->seekbar:Landroid/widget/SeekBar;

    invoke-virtual {v1, v3}, Landroid/widget/SeekBar;->setFocusableInTouchMode(Z)V

    .line 346
    sget-object v1, Lcom/vkontakte/android/audio/player/PlayerState;->PLAYING:Lcom/vkontakte/android/audio/player/PlayerState;

    if-eq p1, v1, :cond_2

    sget-object v1, Lcom/vkontakte/android/audio/player/PlayerState;->PAUSED:Lcom/vkontakte/android/audio/player/PlayerState;

    if-eq p1, v1, :cond_2

    .line 347
    iget-object v1, p0, Lcom/vkontakte/android/AudioAttachView;->seekbar:Landroid/widget/SeekBar;

    invoke-virtual {v1, v3}, Landroid/widget/SeekBar;->setProgress(I)V

    .line 348
    iget-object v1, p0, Lcom/vkontakte/android/AudioAttachView;->seekbar:Landroid/widget/SeekBar;

    invoke-virtual {v1, v3}, Landroid/widget/SeekBar;->setSecondaryProgress(I)V

    .line 359
    :cond_2
    :goto_3
    return-void

    :cond_3
    move v1, v3

    .line 336
    goto :goto_0

    :cond_4
    move v1, v3

    .line 342
    goto :goto_1

    :cond_5
    move v2, v3

    .line 343
    goto :goto_2

    .line 350
    :cond_6
    iget-object v1, p0, Lcom/vkontakte/android/AudioAttachView;->seekbar:Landroid/widget/SeekBar;

    invoke-virtual {v1}, Landroid/widget/SeekBar;->getVisibility()I

    move-result v1

    if-nez v1, :cond_2

    .line 351
    iget-object v1, p0, Lcom/vkontakte/android/AudioAttachView;->seekbar:Landroid/widget/SeekBar;

    invoke-static {v1, v5}, Lme/grishka/appkit/utils/V;->setVisibilityAnimated(Landroid/view/View;I)V

    .line 352
    iget-object v1, p0, Lcom/vkontakte/android/AudioAttachView;->text3:Landroid/widget/TextView;

    invoke-static {v1, v5}, Lme/grishka/appkit/utils/V;->setVisibilityAnimated(Landroid/view/View;I)V

    .line 353
    iget-object v1, p0, Lcom/vkontakte/android/AudioAttachView;->text2:Landroid/widget/TextView;

    invoke-static {v1, v3}, Lme/grishka/appkit/utils/V;->setVisibilityAnimated(Landroid/view/View;I)V

    .line 354
    iget-object v1, p0, Lcom/vkontakte/android/AudioAttachView;->text1:Landroid/widget/TextView;

    invoke-static {v1, v3}, Lme/grishka/appkit/utils/V;->setVisibilityAnimated(Landroid/view/View;I)V

    .line 355
    iget-object v1, p0, Lcom/vkontakte/android/AudioAttachView;->text3:Landroid/widget/TextView;

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setSelected(Z)V

    .line 356
    iget-object v1, p0, Lcom/vkontakte/android/AudioAttachView;->timeText:Landroid/widget/TextView;

    const-string/jumbo v4, "%d:%02d"

    const/4 v5, 0x2

    new-array v5, v5, [Ljava/lang/Object;

    iget v6, p0, Lcom/vkontakte/android/AudioAttachView;->duration:I

    div-int/lit8 v6, v6, 0x3c

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v5, v3

    iget v6, p0, Lcom/vkontakte/android/AudioAttachView;->duration:I

    rem-int/lit8 v6, v6, 0x3c

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v5, v2

    invoke-static {v4, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 357
    invoke-virtual {p0, v3}, Lcom/vkontakte/android/AudioAttachView;->setPlaying(Z)V

    goto :goto_3
.end method

.method public onTrackListChanged(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List",
            "<",
            "Lcom/vkontakte/android/audio/player/PlayerTrack;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 363
    .local p1, "list":Ljava/util/List;, "Ljava/util/List<Lcom/vkontakte/android/audio/player/PlayerTrack;>;"
    return-void
.end method

.method public setData(Ljava/lang/String;Ljava/lang/String;III)V
    .locals 9
    .param p1, "artist"    # Ljava/lang/String;
    .param p2, "title"    # Ljava/lang/String;
    .param p3, "_oid"    # I
    .param p4, "_aid"    # I
    .param p5, "duration"    # I

    .prologue
    const/16 v8, 0x8

    const/4 v7, 0x1

    const/4 v6, 0x0

    .line 183
    iget-object v2, p0, Lcom/vkontakte/android/AudioAttachView;->text1:Landroid/widget/TextView;

    invoke-virtual {v2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 184
    iget-object v2, p0, Lcom/vkontakte/android/AudioAttachView;->text2:Landroid/widget/TextView;

    invoke-virtual {v2, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 185
    new-instance v1, Landroid/text/SpannableStringBuilder;

    invoke-direct {v1, p1}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 186
    .local v1, "ssb":Landroid/text/SpannableStringBuilder;
    invoke-static {}, Landroid/text/Spannable$Factory;->getInstance()Landroid/text/Spannable$Factory;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, " \u2014 "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/text/Spannable$Factory;->newSpannable(Ljava/lang/CharSequence;)Landroid/text/Spannable;

    move-result-object v0

    .line 187
    .local v0, "ss":Landroid/text/Spannable;
    new-instance v2, Landroid/text/style/ForegroundColorSpan;

    const v3, -0x7afffdfb

    invoke-direct {v2, v3}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    invoke-interface {v0}, Landroid/text/Spannable;->length()I

    move-result v3

    invoke-interface {v0, v2, v6, v3, v6}, Landroid/text/Spannable;->setSpan(Ljava/lang/Object;III)V

    .line 188
    new-instance v2, Landroid/text/style/AbsoluteSizeSpan;

    const/16 v3, 0xe

    invoke-direct {v2, v3, v7}, Landroid/text/style/AbsoluteSizeSpan;-><init>(IZ)V

    invoke-interface {v0}, Landroid/text/Spannable;->length()I

    move-result v3

    invoke-interface {v0, v2, v6, v3, v6}, Landroid/text/Spannable;->setSpan(Ljava/lang/Object;III)V

    .line 189
    new-instance v2, Landroid/text/style/TypefaceSpan;

    const-string/jumbo v3, "sans-serif"

    invoke-direct {v2, v3}, Landroid/text/style/TypefaceSpan;-><init>(Ljava/lang/String;)V

    invoke-interface {v0}, Landroid/text/Spannable;->length()I

    move-result v3

    invoke-interface {v0, v2, v6, v3, v6}, Landroid/text/Spannable;->setSpan(Ljava/lang/Object;III)V

    .line 190
    invoke-virtual {v1, v0}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 191
    iget-object v2, p0, Lcom/vkontakte/android/AudioAttachView;->text3:Landroid/widget/TextView;

    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 192
    iget-object v2, p0, Lcom/vkontakte/android/AudioAttachView;->text1:Landroid/widget/TextView;

    invoke-virtual {v2, v6}, Landroid/widget/TextView;->setVisibility(I)V

    .line 193
    iget-object v2, p0, Lcom/vkontakte/android/AudioAttachView;->text2:Landroid/widget/TextView;

    invoke-virtual {v2, v6}, Landroid/widget/TextView;->setVisibility(I)V

    .line 194
    iget-object v2, p0, Lcom/vkontakte/android/AudioAttachView;->text3:Landroid/widget/TextView;

    invoke-virtual {v2, v8}, Landroid/widget/TextView;->setVisibility(I)V

    .line 195
    iget-object v2, p0, Lcom/vkontakte/android/AudioAttachView;->text3:Landroid/widget/TextView;

    invoke-virtual {v2, v6}, Landroid/widget/TextView;->setSelected(Z)V

    .line 196
    iget-object v2, p0, Lcom/vkontakte/android/AudioAttachView;->timeText:Landroid/widget/TextView;

    const-string/jumbo v3, "%d:%02d"

    const/4 v4, 0x2

    new-array v4, v4, [Ljava/lang/Object;

    div-int/lit8 v5, p5, 0x3c

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v4, v6

    rem-int/lit8 v5, p5, 0x3c

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    aput-object v5, v4, v7

    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 197
    iget-object v2, p0, Lcom/vkontakte/android/AudioAttachView;->seekbar:Landroid/widget/SeekBar;

    const/4 v3, 0x4

    invoke-virtual {v2, v3}, Landroid/widget/SeekBar;->setVisibility(I)V

    .line 199
    invoke-virtual {p0, p0}, Lcom/vkontakte/android/AudioAttachView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 200
    invoke-virtual {p0, p0}, Lcom/vkontakte/android/AudioAttachView;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 202
    iput p3, p0, Lcom/vkontakte/android/AudioAttachView;->oid:I

    .line 203
    iput p4, p0, Lcom/vkontakte/android/AudioAttachView;->id:I

    .line 204
    iput-object p1, p0, Lcom/vkontakte/android/AudioAttachView;->artist:Ljava/lang/String;

    .line 205
    iput-object p2, p0, Lcom/vkontakte/android/AudioAttachView;->title:Ljava/lang/String;

    .line 206
    iput p5, p0, Lcom/vkontakte/android/AudioAttachView;->duration:I

    .line 207
    iget v2, p0, Lcom/vkontakte/android/AudioAttachView;->oid:I

    iget v3, p0, Lcom/vkontakte/android/AudioAttachView;->id:I

    invoke-static {v2, v3}, Lcom/vkontakte/android/audio/AudioFacade;->isCurrentTrack(II)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 208
    invoke-static {}, Lcom/vkontakte/android/audio/AudioFacade;->getPlayerState()Lcom/vkontakte/android/audio/player/PlayerState;

    move-result-object v2

    invoke-virtual {v2}, Lcom/vkontakte/android/audio/player/PlayerState;->isPlayState()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 209
    iput-boolean v7, p0, Lcom/vkontakte/android/AudioAttachView;->isPlaying:Z

    .line 210
    const v2, 0x7f020167

    invoke-direct {p0, v2}, Lcom/vkontakte/android/AudioAttachView;->replaceIcon(I)V

    .line 212
    :cond_0
    iget-object v2, p0, Lcom/vkontakte/android/AudioAttachView;->text1:Landroid/widget/TextView;

    invoke-virtual {v2, v8}, Landroid/widget/TextView;->setVisibility(I)V

    .line 213
    iget-object v2, p0, Lcom/vkontakte/android/AudioAttachView;->text2:Landroid/widget/TextView;

    invoke-virtual {v2, v8}, Landroid/widget/TextView;->setVisibility(I)V

    .line 214
    iget-object v2, p0, Lcom/vkontakte/android/AudioAttachView;->text3:Landroid/widget/TextView;

    invoke-virtual {v2, v6}, Landroid/widget/TextView;->setVisibility(I)V

    .line 215
    iget-object v2, p0, Lcom/vkontakte/android/AudioAttachView;->text3:Landroid/widget/TextView;

    invoke-virtual {v2, v7}, Landroid/widget/TextView;->setSelected(Z)V

    .line 216
    iget-object v2, p0, Lcom/vkontakte/android/AudioAttachView;->seekbar:Landroid/widget/SeekBar;

    invoke-virtual {v2, v6}, Landroid/widget/SeekBar;->setVisibility(I)V

    .line 217
    iget-object v2, p0, Lcom/vkontakte/android/AudioAttachView;->seekbar:Landroid/widget/SeekBar;

    invoke-virtual {v2, v6}, Landroid/widget/SeekBar;->setFocusable(Z)V

    .line 218
    iget-object v2, p0, Lcom/vkontakte/android/AudioAttachView;->seekbar:Landroid/widget/SeekBar;

    invoke-virtual {v2, v6}, Landroid/widget/SeekBar;->setFocusableInTouchMode(Z)V

    .line 223
    :goto_0
    iget-object v2, p0, Lcom/vkontakte/android/AudioAttachView;->seekbar:Landroid/widget/SeekBar;

    new-instance v3, Lcom/vkontakte/android/AudioAttachView$2;

    invoke-direct {v3, p0}, Lcom/vkontakte/android/AudioAttachView$2;-><init>(Lcom/vkontakte/android/AudioAttachView;)V

    invoke-virtual {v2, v3}, Landroid/widget/SeekBar;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    .line 241
    return-void

    .line 220
    :cond_1
    iput-boolean v6, p0, Lcom/vkontakte/android/AudioAttachView;->isPlaying:Z

    .line 221
    const v2, 0x7f020168

    invoke-direct {p0, v2}, Lcom/vkontakte/android/AudioAttachView;->replaceIcon(I)V

    goto :goto_0
.end method

.method public setPlaying(Z)V
    .locals 1
    .param p1, "p"    # Z

    .prologue
    .line 299
    invoke-virtual {p0}, Lcom/vkontakte/android/AudioAttachView;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    if-nez v0, :cond_0

    .line 304
    :goto_0
    return-void

    .line 302
    :cond_0
    iput-boolean p1, p0, Lcom/vkontakte/android/AudioAttachView;->isPlaying:Z

    .line 303
    iget-boolean v0, p0, Lcom/vkontakte/android/AudioAttachView;->isPlaying:Z

    if-eqz v0, :cond_1

    const v0, 0x7f020167

    :goto_1
    invoke-direct {p0, v0}, Lcom/vkontakte/android/AudioAttachView;->replaceIcon(I)V

    goto :goto_0

    :cond_1
    const v0, 0x7f020168

    goto :goto_1
.end method

.method public setReferData(Ljava/lang/String;Lcom/vkontakte/android/data/PostInteract;)V
    .locals 0
    .param p1, "refer"    # Ljava/lang/String;
    .param p2, "postInteract"    # Lcom/vkontakte/android/data/PostInteract;

    .prologue
    .line 64
    iput-object p1, p0, Lcom/vkontakte/android/AudioAttachView;->refer:Ljava/lang/String;

    .line 65
    iput-object p2, p0, Lcom/vkontakte/android/AudioAttachView;->postInteract:Lcom/vkontakte/android/data/PostInteract;

    .line 66
    return-void
.end method
