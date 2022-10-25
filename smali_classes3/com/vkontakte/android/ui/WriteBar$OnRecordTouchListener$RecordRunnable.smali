.class Lcom/vkontakte/android/ui/WriteBar$OnRecordTouchListener$RecordRunnable;
.super Ljava/lang/Object;
.source "WriteBar.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/ui/WriteBar$OnRecordTouchListener;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "RecordRunnable"
.end annotation


# instance fields
.field final synthetic this$1:Lcom/vkontakte/android/ui/WriteBar$OnRecordTouchListener;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/ui/WriteBar$OnRecordTouchListener;)V
    .locals 0

    .prologue
    .line 1162
    iput-object p1, p0, Lcom/vkontakte/android/ui/WriteBar$OnRecordTouchListener$RecordRunnable;->this$1:Lcom/vkontakte/android/ui/WriteBar$OnRecordTouchListener;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/vkontakte/android/ui/WriteBar$OnRecordTouchListener;Lcom/vkontakte/android/ui/WriteBar$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/vkontakte/android/ui/WriteBar$OnRecordTouchListener;
    .param p2, "x1"    # Lcom/vkontakte/android/ui/WriteBar$1;

    .prologue
    .line 1162
    invoke-direct {p0, p1}, Lcom/vkontakte/android/ui/WriteBar$OnRecordTouchListener$RecordRunnable;-><init>(Lcom/vkontakte/android/ui/WriteBar$OnRecordTouchListener;)V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 1165
    iget-object v0, p0, Lcom/vkontakte/android/ui/WriteBar$OnRecordTouchListener$RecordRunnable;->this$1:Lcom/vkontakte/android/ui/WriteBar$OnRecordTouchListener;

    invoke-static {v0}, Lcom/vkontakte/android/ui/WriteBar$OnRecordTouchListener;->access$4300(Lcom/vkontakte/android/ui/WriteBar$OnRecordTouchListener;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1166
    iget-object v0, p0, Lcom/vkontakte/android/ui/WriteBar$OnRecordTouchListener$RecordRunnable;->this$1:Lcom/vkontakte/android/ui/WriteBar$OnRecordTouchListener;

    invoke-static {v0, v2}, Lcom/vkontakte/android/ui/WriteBar$OnRecordTouchListener;->access$4302(Lcom/vkontakte/android/ui/WriteBar$OnRecordTouchListener;Z)Z

    .line 1167
    iget-object v0, p0, Lcom/vkontakte/android/ui/WriteBar$OnRecordTouchListener$RecordRunnable;->this$1:Lcom/vkontakte/android/ui/WriteBar$OnRecordTouchListener;

    iget-object v0, v0, Lcom/vkontakte/android/ui/WriteBar$OnRecordTouchListener;->this$0:Lcom/vkontakte/android/ui/WriteBar;

    invoke-static {v0}, Lcom/vkontakte/android/ui/WriteBar;->access$4400(Lcom/vkontakte/android/ui/WriteBar;)V

    .line 1168
    iget-object v0, p0, Lcom/vkontakte/android/ui/WriteBar$OnRecordTouchListener$RecordRunnable;->this$1:Lcom/vkontakte/android/ui/WriteBar$OnRecordTouchListener;

    iget-object v0, v0, Lcom/vkontakte/android/ui/WriteBar$OnRecordTouchListener;->this$0:Lcom/vkontakte/android/ui/WriteBar;

    invoke-static {v0}, Lcom/vkontakte/android/ui/WriteBar;->access$600(Lcom/vkontakte/android/ui/WriteBar;)Lcom/vkontakte/android/media/audio/AudioMessageUtils;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/ui/WriteBar$OnRecordTouchListener$RecordRunnable;->this$1:Lcom/vkontakte/android/ui/WriteBar$OnRecordTouchListener;

    iget-object v1, v1, Lcom/vkontakte/android/ui/WriteBar$OnRecordTouchListener;->this$0:Lcom/vkontakte/android/ui/WriteBar;

    invoke-static {v1}, Lcom/vkontakte/android/ui/WriteBar;->access$400(Lcom/vkontakte/android/ui/WriteBar;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1, v2}, Lcom/vkontakte/android/media/audio/AudioMessageUtils;->startRecording(Ljava/lang/String;Z)V

    .line 1170
    :cond_0
    return-void
.end method
