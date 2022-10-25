.class Lcom/vkontakte/android/ui/WriteBar$OnRecordTouchListener;
.super Ljava/lang/Object;
.source "WriteBar.java"

# interfaces
.implements Landroid/view/View$OnTouchListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/ui/WriteBar;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "OnRecordTouchListener"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/ui/WriteBar$OnRecordTouchListener$RecordRunnable;
    }
.end annotation


# instance fields
.field private isLongPress:Z

.field private final longClickDuration:I

.field private final recordRunnable:Ljava/lang/Runnable;

.field final synthetic this$0:Lcom/vkontakte/android/ui/WriteBar;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/ui/WriteBar;)V
    .locals 2

    .prologue
    .line 1126
    iput-object p1, p0, Lcom/vkontakte/android/ui/WriteBar$OnRecordTouchListener;->this$0:Lcom/vkontakte/android/ui/WriteBar;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1127
    new-instance v0, Lcom/vkontakte/android/ui/WriteBar$OnRecordTouchListener$RecordRunnable;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/vkontakte/android/ui/WriteBar$OnRecordTouchListener$RecordRunnable;-><init>(Lcom/vkontakte/android/ui/WriteBar$OnRecordTouchListener;Lcom/vkontakte/android/ui/WriteBar$1;)V

    iput-object v0, p0, Lcom/vkontakte/android/ui/WriteBar$OnRecordTouchListener;->recordRunnable:Ljava/lang/Runnable;

    .line 1128
    const/16 v0, 0xc8

    iput v0, p0, Lcom/vkontakte/android/ui/WriteBar$OnRecordTouchListener;->longClickDuration:I

    return-void
.end method

.method synthetic constructor <init>(Lcom/vkontakte/android/ui/WriteBar;Lcom/vkontakte/android/ui/WriteBar$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/vkontakte/android/ui/WriteBar;
    .param p2, "x1"    # Lcom/vkontakte/android/ui/WriteBar$1;

    .prologue
    .line 1126
    invoke-direct {p0, p1}, Lcom/vkontakte/android/ui/WriteBar$OnRecordTouchListener;-><init>(Lcom/vkontakte/android/ui/WriteBar;)V

    return-void
.end method

.method static synthetic access$4300(Lcom/vkontakte/android/ui/WriteBar$OnRecordTouchListener;)Z
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/ui/WriteBar$OnRecordTouchListener;

    .prologue
    .line 1126
    iget-boolean v0, p0, Lcom/vkontakte/android/ui/WriteBar$OnRecordTouchListener;->isLongPress:Z

    return v0
.end method

.method static synthetic access$4302(Lcom/vkontakte/android/ui/WriteBar$OnRecordTouchListener;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/ui/WriteBar$OnRecordTouchListener;
    .param p1, "x1"    # Z

    .prologue
    .line 1126
    iput-boolean p1, p0, Lcom/vkontakte/android/ui/WriteBar$OnRecordTouchListener;->isLongPress:Z

    return p1
.end method


# virtual methods
.method synthetic lambda$onTouch$0()V
    .locals 1

    .prologue
    .line 1153
    iget-object v0, p0, Lcom/vkontakte/android/ui/WriteBar$OnRecordTouchListener;->this$0:Lcom/vkontakte/android/ui/WriteBar;

    invoke-static {v0}, Lcom/vkontakte/android/ui/WriteBar;->access$3200(Lcom/vkontakte/android/ui/WriteBar;)Lcom/vkontakte/android/ui/widget/RichEditText;

    move-result-object v0

    invoke-virtual {v0}, Lcom/vkontakte/android/ui/widget/RichEditText;->requestFocus()Z

    return-void
.end method

.method public onTouch(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 6
    .param p1, "view"    # Landroid/view/View;
    .param p2, "motionEvent"    # Landroid/view/MotionEvent;

    .prologue
    const-wide/16 v4, 0x4b0

    const/4 v3, 0x0

    .line 1133
    iget-object v1, p0, Lcom/vkontakte/android/ui/WriteBar$OnRecordTouchListener;->this$0:Lcom/vkontakte/android/ui/WriteBar;

    invoke-static {v1}, Lcom/vkontakte/android/ui/WriteBar;->access$800(Lcom/vkontakte/android/ui/WriteBar;)Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->getRecButtonView()Landroid/view/View;

    move-result-object v0

    .line 1134
    .local v0, "recButton":Landroid/view/View;
    if-eqz v0, :cond_0

    iget-object v1, p0, Lcom/vkontakte/android/ui/WriteBar$OnRecordTouchListener;->this$0:Lcom/vkontakte/android/ui/WriteBar;

    invoke-static {v1}, Lcom/vkontakte/android/ui/WriteBar;->access$800(Lcom/vkontakte/android/ui/WriteBar;)Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vkontakte/android/ui/widget/VoiceRecordControlPopupWindow;->isShowing()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1135
    invoke-virtual {v0, p2}, Landroid/view/View;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    .line 1137
    :cond_0
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result v1

    packed-switch v1, :pswitch_data_0

    .line 1158
    :cond_1
    :goto_0
    :pswitch_0
    return v3

    .line 1139
    :pswitch_1
    iget-object v1, p0, Lcom/vkontakte/android/ui/WriteBar$OnRecordTouchListener;->this$0:Lcom/vkontakte/android/ui/WriteBar;

    invoke-static {v1}, Lcom/vkontakte/android/ui/WriteBar;->access$4000(Lcom/vkontakte/android/ui/WriteBar;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 1140
    iput-boolean v3, p0, Lcom/vkontakte/android/ui/WriteBar$OnRecordTouchListener;->isLongPress:Z

    .line 1141
    iget-object v1, p0, Lcom/vkontakte/android/ui/WriteBar$OnRecordTouchListener;->this$0:Lcom/vkontakte/android/ui/WriteBar;

    iget-object v2, p0, Lcom/vkontakte/android/ui/WriteBar$OnRecordTouchListener;->this$0:Lcom/vkontakte/android/ui/WriteBar;

    invoke-static {v2}, Lcom/vkontakte/android/ui/WriteBar;->access$4100(Lcom/vkontakte/android/ui/WriteBar;)Ljava/lang/Runnable;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/ui/WriteBar;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 1142
    iget-object v1, p0, Lcom/vkontakte/android/ui/WriteBar$OnRecordTouchListener;->this$0:Lcom/vkontakte/android/ui/WriteBar;

    iget-object v2, p0, Lcom/vkontakte/android/ui/WriteBar$OnRecordTouchListener;->recordRunnable:Ljava/lang/Runnable;

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/ui/WriteBar;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 1143
    iget-object v1, p0, Lcom/vkontakte/android/ui/WriteBar$OnRecordTouchListener;->this$0:Lcom/vkontakte/android/ui/WriteBar;

    iget-object v2, p0, Lcom/vkontakte/android/ui/WriteBar$OnRecordTouchListener;->recordRunnable:Ljava/lang/Runnable;

    const-wide/16 v4, 0xc8

    invoke-virtual {v1, v2, v4, v5}, Lcom/vkontakte/android/ui/WriteBar;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 1144
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/vkontakte/android/ui/WriteBar$OnRecordTouchListener;->isLongPress:Z

    goto :goto_0

    .line 1149
    :pswitch_2
    iget-boolean v1, p0, Lcom/vkontakte/android/ui/WriteBar$OnRecordTouchListener;->isLongPress:Z

    if-eqz v1, :cond_1

    .line 1150
    iput-boolean v3, p0, Lcom/vkontakte/android/ui/WriteBar$OnRecordTouchListener;->isLongPress:Z

    .line 1151
    iget-object v1, p0, Lcom/vkontakte/android/ui/WriteBar$OnRecordTouchListener;->this$0:Lcom/vkontakte/android/ui/WriteBar;

    invoke-static {v1}, Lcom/vkontakte/android/ui/WriteBar;->access$3600(Lcom/vkontakte/android/ui/WriteBar;)Landroid/view/View;

    move-result-object v1

    invoke-static {v1, v3}, Lme/grishka/appkit/utils/V;->setVisibilityAnimated(Landroid/view/View;I)V

    .line 1152
    iget-object v1, p0, Lcom/vkontakte/android/ui/WriteBar$OnRecordTouchListener;->this$0:Lcom/vkontakte/android/ui/WriteBar;

    invoke-static {v1}, Lcom/vkontakte/android/ui/WriteBar;->access$4200(Lcom/vkontakte/android/ui/WriteBar;)Landroid/view/ViewGroup;

    move-result-object v1

    const/4 v2, 0x4

    invoke-static {v1, v2}, Lme/grishka/appkit/utils/V;->setVisibilityAnimated(Landroid/view/View;I)V

    .line 1153
    iget-object v1, p0, Lcom/vkontakte/android/ui/WriteBar$OnRecordTouchListener;->this$0:Lcom/vkontakte/android/ui/WriteBar;

    invoke-static {p0}, Lcom/vkontakte/android/ui/WriteBar$OnRecordTouchListener$$Lambda$1;->lambdaFactory$(Lcom/vkontakte/android/ui/WriteBar$OnRecordTouchListener;)Ljava/lang/Runnable;

    move-result-object v2

    invoke-virtual {v1, v2, v4, v5}, Lcom/vkontakte/android/ui/WriteBar;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 1154
    iget-object v1, p0, Lcom/vkontakte/android/ui/WriteBar$OnRecordTouchListener;->this$0:Lcom/vkontakte/android/ui/WriteBar;

    iget-object v2, p0, Lcom/vkontakte/android/ui/WriteBar$OnRecordTouchListener;->this$0:Lcom/vkontakte/android/ui/WriteBar;

    invoke-static {v2}, Lcom/vkontakte/android/ui/WriteBar;->access$4100(Lcom/vkontakte/android/ui/WriteBar;)Ljava/lang/Runnable;

    move-result-object v2

    invoke-virtual {v1, v2, v4, v5}, Lcom/vkontakte/android/ui/WriteBar;->postDelayed(Ljava/lang/Runnable;J)Z

    goto :goto_0

    .line 1137
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_2
        :pswitch_0
        :pswitch_2
    .end packed-switch
.end method
