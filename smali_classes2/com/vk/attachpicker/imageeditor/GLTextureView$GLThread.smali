.class Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThread;
.super Ljava/lang/Thread;
.source "GLTextureView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/attachpicker/imageeditor/GLTextureView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "GLThread"
.end annotation


# instance fields
.field private mEglHelper:Lcom/vk/attachpicker/imageeditor/GLTextureView$EglHelper;

.field private mEventQueue:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Runnable;",
            ">;"
        }
    .end annotation
.end field

.field private mExited:Z

.field private mFinishedCreatingEglSurface:Z

.field private mGLTextureViewWeakRef:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference",
            "<",
            "Lcom/vk/attachpicker/imageeditor/GLTextureView;",
            ">;"
        }
    .end annotation
.end field

.field private mHasSurface:Z

.field private mHaveEglContext:Z

.field private mHaveEglSurface:Z

.field private mHeight:I

.field private mPaused:Z

.field private mRenderComplete:Z

.field private mRenderMode:I

.field private mRequestPaused:Z

.field private mRequestRender:Z

.field private mShouldExit:Z

.field private mShouldReleaseEglContext:Z

.field private mSizeChanged:Z

.field private mSurfaceIsBad:Z

.field private mWaitingForSurface:Z

.field private mWidth:I


# direct methods
.method constructor <init>(Ljava/lang/ref/WeakReference;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/ref/WeakReference",
            "<",
            "Lcom/vk/attachpicker/imageeditor/GLTextureView;",
            ">;)V"
        }
    .end annotation

    .prologue
    .local p1, "glTextureViewWeakRef":Ljava/lang/ref/WeakReference;, "Ljava/lang/ref/WeakReference<Lcom/vk/attachpicker/imageeditor/GLTextureView;>;"
    const/4 v2, 0x0

    const/4 v1, 0x1

    .line 1023
    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    .line 1557
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThread;->mEventQueue:Ljava/util/ArrayList;

    .line 1558
    iput-boolean v1, p0, Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThread;->mSizeChanged:Z

    .line 1024
    iput v2, p0, Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThread;->mWidth:I

    .line 1025
    iput v2, p0, Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThread;->mHeight:I

    .line 1026
    iput-boolean v1, p0, Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThread;->mRequestRender:Z

    .line 1027
    iput v1, p0, Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThread;->mRenderMode:I

    .line 1028
    iput-object p1, p0, Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThread;->mGLTextureViewWeakRef:Ljava/lang/ref/WeakReference;

    .line 1029
    return-void
.end method

.method static synthetic access$1102(Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThread;Z)Z
    .locals 0
    .param p0, "x0"    # Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThread;
    .param p1, "x1"    # Z

    .prologue
    .line 1021
    iput-boolean p1, p0, Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThread;->mExited:Z

    return p1
.end method

.method private guardedRun()V
    .locals 22
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .prologue
    .line 1072
    new-instance v19, Lcom/vk/attachpicker/imageeditor/GLTextureView$EglHelper;

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThread;->mGLTextureViewWeakRef:Ljava/lang/ref/WeakReference;

    move-object/from16 v20, v0

    invoke-direct/range {v19 .. v20}, Lcom/vk/attachpicker/imageeditor/GLTextureView$EglHelper;-><init>(Ljava/lang/ref/WeakReference;)V

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    iput-object v0, v1, Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThread;->mEglHelper:Lcom/vk/attachpicker/imageeditor/GLTextureView$EglHelper;

    .line 1073
    const/16 v19, 0x0

    move/from16 v0, v19

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThread;->mHaveEglContext:Z

    .line 1074
    const/16 v19, 0x0

    move/from16 v0, v19

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThread;->mHaveEglSurface:Z

    .line 1076
    const/4 v8, 0x0

    .line 1077
    .local v8, "gl":Ljavax/microedition/khronos/opengles/GL10;
    const/4 v3, 0x0

    .line 1078
    .local v3, "createEglContext":Z
    const/4 v4, 0x0

    .line 1079
    .local v4, "createEglSurface":Z
    const/4 v5, 0x0

    .line 1080
    .local v5, "createGlInterface":Z
    const/4 v10, 0x0

    .line 1081
    .local v10, "lostEglContext":Z
    const/4 v13, 0x0

    .line 1082
    .local v13, "sizeChanged":Z
    const/16 v18, 0x0

    .line 1083
    .local v18, "wantRenderNotification":Z
    const/4 v6, 0x0

    .line 1084
    .local v6, "doRenderNotification":Z
    const/4 v2, 0x0

    .line 1085
    .local v2, "askedToReleaseEglContext":Z
    const/16 v17, 0x0

    .line 1086
    .local v17, "w":I
    const/4 v9, 0x0

    .line 1087
    .local v9, "h":I
    const/4 v7, 0x0

    .line 1090
    .local v7, "event":Ljava/lang/Runnable;
    :cond_0
    :goto_0
    :try_start_0
    invoke-static {}, Lcom/vk/attachpicker/imageeditor/GLTextureView;->access$800()Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThreadManager;

    move-result-object v20

    monitor-enter v20
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    .line 1092
    :goto_1
    :try_start_1
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThread;->mShouldExit:Z

    move/from16 v19, v0

    if-eqz v19, :cond_1

    .line 1093
    monitor-exit v20
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 1360
    invoke-static {}, Lcom/vk/attachpicker/imageeditor/GLTextureView;->access$800()Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThreadManager;

    move-result-object v20

    monitor-enter v20

    .line 1361
    :try_start_2
    invoke-direct/range {p0 .. p0}, Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThread;->stopEglSurfaceLocked()V

    .line 1362
    invoke-direct/range {p0 .. p0}, Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThread;->stopEglContextLocked()V

    .line 1363
    monitor-exit v20

    .line 1093
    return-void

    .line 1363
    :catchall_0
    move-exception v19

    monitor-exit v20
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v19

    .line 1096
    :cond_1
    :try_start_3
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThread;->mEventQueue:Ljava/util/ArrayList;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v19

    if-nez v19, :cond_2

    .line 1097
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThread;->mEventQueue:Ljava/util/ArrayList;

    move-object/from16 v19, v0

    const/16 v21, 0x0

    move-object/from16 v0, v19

    move/from16 v1, v21

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    move-result-object v19

    move-object/from16 v0, v19

    check-cast v0, Ljava/lang/Runnable;

    move-object v7, v0

    .line 1261
    :goto_2
    monitor-exit v20
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 1263
    if-eqz v7, :cond_14

    .line 1264
    :try_start_4
    invoke-interface {v7}, Ljava/lang/Runnable;->run()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 1265
    const/4 v7, 0x0

    .line 1266
    goto :goto_0

    .line 1102
    :cond_2
    const/4 v11, 0x0

    .line 1103
    .local v11, "pausing":Z
    :try_start_5
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThread;->mPaused:Z

    move/from16 v19, v0

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThread;->mRequestPaused:Z

    move/from16 v21, v0

    move/from16 v0, v19

    move/from16 v1, v21

    if-eq v0, v1, :cond_3

    .line 1104
    move-object/from16 v0, p0

    iget-boolean v11, v0, Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThread;->mRequestPaused:Z

    .line 1105
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThread;->mRequestPaused:Z

    move/from16 v19, v0

    move/from16 v0, v19

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThread;->mPaused:Z

    .line 1106
    invoke-static {}, Lcom/vk/attachpicker/imageeditor/GLTextureView;->access$800()Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThreadManager;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/Object;->notifyAll()V

    .line 1113
    :cond_3
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThread;->mShouldReleaseEglContext:Z

    move/from16 v19, v0

    if-eqz v19, :cond_4

    .line 1117
    invoke-direct/range {p0 .. p0}, Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThread;->stopEglSurfaceLocked()V

    .line 1118
    invoke-direct/range {p0 .. p0}, Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThread;->stopEglContextLocked()V

    .line 1119
    const/16 v19, 0x0

    move/from16 v0, v19

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThread;->mShouldReleaseEglContext:Z

    .line 1120
    const/4 v2, 0x1

    .line 1124
    :cond_4
    if-eqz v10, :cond_5

    .line 1125
    invoke-direct/range {p0 .. p0}, Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThread;->stopEglSurfaceLocked()V

    .line 1126
    invoke-direct/range {p0 .. p0}, Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThread;->stopEglContextLocked()V

    .line 1127
    const/4 v10, 0x0

    .line 1131
    :cond_5
    if-eqz v11, :cond_6

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThread;->mHaveEglSurface:Z

    move/from16 v19, v0

    if-eqz v19, :cond_6

    .line 1135
    invoke-direct/range {p0 .. p0}, Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThread;->stopEglSurfaceLocked()V

    .line 1139
    :cond_6
    if-eqz v11, :cond_8

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThread;->mHaveEglContext:Z

    move/from16 v19, v0

    if-eqz v19, :cond_8

    .line 1140
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThread;->mGLTextureViewWeakRef:Ljava/lang/ref/WeakReference;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Lcom/vk/attachpicker/imageeditor/GLTextureView;

    .line 1141
    .local v16, "view":Lcom/vk/attachpicker/imageeditor/GLTextureView;
    if-nez v16, :cond_11

    const/4 v12, 0x0

    .line 1143
    .local v12, "preserveEglContextOnPause":Z
    :goto_3
    if-eqz v12, :cond_7

    invoke-static {}, Lcom/vk/attachpicker/imageeditor/GLTextureView;->access$800()Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThreadManager;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThreadManager;->shouldReleaseEGLContextWhenPausing()Z

    move-result v19

    if-eqz v19, :cond_8

    .line 1144
    :cond_7
    invoke-direct/range {p0 .. p0}, Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThread;->stopEglContextLocked()V

    .line 1152
    .end local v12    # "preserveEglContextOnPause":Z
    .end local v16    # "view":Lcom/vk/attachpicker/imageeditor/GLTextureView;
    :cond_8
    if-eqz v11, :cond_9

    .line 1153
    invoke-static {}, Lcom/vk/attachpicker/imageeditor/GLTextureView;->access$800()Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThreadManager;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThreadManager;->shouldTerminateEGLWhenPausing()Z

    move-result v19

    if-eqz v19, :cond_9

    .line 1154
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThread;->mEglHelper:Lcom/vk/attachpicker/imageeditor/GLTextureView$EglHelper;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lcom/vk/attachpicker/imageeditor/GLTextureView$EglHelper;->finish()V

    .line 1162
    :cond_9
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThread;->mHasSurface:Z

    move/from16 v19, v0

    if-nez v19, :cond_b

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThread;->mWaitingForSurface:Z

    move/from16 v19, v0

    if-nez v19, :cond_b

    .line 1166
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThread;->mHaveEglSurface:Z

    move/from16 v19, v0

    if-eqz v19, :cond_a

    .line 1167
    invoke-direct/range {p0 .. p0}, Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThread;->stopEglSurfaceLocked()V

    .line 1169
    :cond_a
    const/16 v19, 0x1

    move/from16 v0, v19

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThread;->mWaitingForSurface:Z

    .line 1170
    const/16 v19, 0x0

    move/from16 v0, v19

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThread;->mSurfaceIsBad:Z

    .line 1171
    invoke-static {}, Lcom/vk/attachpicker/imageeditor/GLTextureView;->access$800()Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThreadManager;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/Object;->notifyAll()V

    .line 1175
    :cond_b
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThread;->mHasSurface:Z

    move/from16 v19, v0

    if-eqz v19, :cond_c

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThread;->mWaitingForSurface:Z

    move/from16 v19, v0

    if-eqz v19, :cond_c

    .line 1179
    const/16 v19, 0x0

    move/from16 v0, v19

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThread;->mWaitingForSurface:Z

    .line 1180
    invoke-static {}, Lcom/vk/attachpicker/imageeditor/GLTextureView;->access$800()Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThreadManager;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/Object;->notifyAll()V

    .line 1183
    :cond_c
    if-eqz v6, :cond_d

    .line 1187
    const/16 v18, 0x0

    .line 1188
    const/4 v6, 0x0

    .line 1189
    const/16 v19, 0x1

    move/from16 v0, v19

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThread;->mRenderComplete:Z

    .line 1190
    invoke-static {}, Lcom/vk/attachpicker/imageeditor/GLTextureView;->access$800()Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThreadManager;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/Object;->notifyAll()V

    .line 1194
    :cond_d
    invoke-direct/range {p0 .. p0}, Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThread;->readyToDraw()Z

    move-result v19

    if-eqz v19, :cond_13

    .line 1197
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThread;->mHaveEglContext:Z

    move/from16 v19, v0

    if-nez v19, :cond_e

    .line 1198
    if-eqz v2, :cond_12

    .line 1199
    const/4 v2, 0x0

    .line 1214
    :cond_e
    :goto_4
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThread;->mHaveEglContext:Z

    move/from16 v19, v0

    if-eqz v19, :cond_f

    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThread;->mHaveEglSurface:Z

    move/from16 v19, v0

    if-nez v19, :cond_f

    .line 1215
    const/16 v19, 0x1

    move/from16 v0, v19

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThread;->mHaveEglSurface:Z

    .line 1216
    const/4 v4, 0x1

    .line 1217
    const/4 v5, 0x1

    .line 1218
    const/4 v13, 0x1

    .line 1221
    :cond_f
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThread;->mHaveEglSurface:Z

    move/from16 v19, v0

    if-eqz v19, :cond_13

    .line 1222
    move-object/from16 v0, p0

    iget-boolean v0, v0, Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThread;->mSizeChanged:Z

    move/from16 v19, v0

    if-eqz v19, :cond_10

    .line 1223
    const/4 v13, 0x1

    .line 1224
    move-object/from16 v0, p0

    iget v0, v0, Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThread;->mWidth:I

    move/from16 v17, v0

    .line 1225
    move-object/from16 v0, p0

    iget v9, v0, Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThread;->mHeight:I

    .line 1226
    const/16 v18, 0x1

    .line 1234
    const/4 v4, 0x1

    .line 1236
    const/16 v19, 0x0

    move/from16 v0, v19

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThread;->mSizeChanged:Z

    .line 1238
    :cond_10
    const/16 v19, 0x0

    move/from16 v0, v19

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThread;->mRequestRender:Z

    .line 1239
    invoke-static {}, Lcom/vk/attachpicker/imageeditor/GLTextureView;->access$800()Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThreadManager;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/Object;->notifyAll()V

    goto/16 :goto_2

    .line 1261
    .end local v11    # "pausing":Z
    :catchall_1
    move-exception v19

    monitor-exit v20
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    :try_start_6
    throw v19
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    .line 1360
    :catchall_2
    move-exception v19

    invoke-static {}, Lcom/vk/attachpicker/imageeditor/GLTextureView;->access$800()Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThreadManager;

    move-result-object v20

    monitor-enter v20

    .line 1361
    :try_start_7
    invoke-direct/range {p0 .. p0}, Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThread;->stopEglSurfaceLocked()V

    .line 1362
    invoke-direct/range {p0 .. p0}, Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThread;->stopEglContextLocked()V

    .line 1363
    monitor-exit v20
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_6

    throw v19

    .line 1142
    .restart local v11    # "pausing":Z
    .restart local v16    # "view":Lcom/vk/attachpicker/imageeditor/GLTextureView;
    :cond_11
    :try_start_8
    invoke-static/range {v16 .. v16}, Lcom/vk/attachpicker/imageeditor/GLTextureView;->access$900(Lcom/vk/attachpicker/imageeditor/GLTextureView;)Z

    move-result v12

    goto/16 :goto_3

    .line 1200
    .end local v16    # "view":Lcom/vk/attachpicker/imageeditor/GLTextureView;
    :cond_12
    invoke-static {}, Lcom/vk/attachpicker/imageeditor/GLTextureView;->access$800()Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThreadManager;

    move-result-object v19

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThreadManager;->tryAcquireEglContextLocked(Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThread;)Z
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_1

    move-result v19

    if-eqz v19, :cond_e

    .line 1202
    :try_start_9
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThread;->mEglHelper:Lcom/vk/attachpicker/imageeditor/GLTextureView$EglHelper;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lcom/vk/attachpicker/imageeditor/GLTextureView$EglHelper;->start()V
    :try_end_9
    .catch Ljava/lang/RuntimeException; {:try_start_9 .. :try_end_9} :catch_0
    .catchall {:try_start_9 .. :try_end_9} :catchall_1

    .line 1207
    const/16 v19, 0x1

    :try_start_a
    move/from16 v0, v19

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThread;->mHaveEglContext:Z

    .line 1208
    const/4 v3, 0x1

    .line 1210
    invoke-static {}, Lcom/vk/attachpicker/imageeditor/GLTextureView;->access$800()Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThreadManager;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/Object;->notifyAll()V

    goto/16 :goto_4

    .line 1203
    :catch_0
    move-exception v15

    .line 1204
    .local v15, "t":Ljava/lang/RuntimeException;
    invoke-static {}, Lcom/vk/attachpicker/imageeditor/GLTextureView;->access$800()Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThreadManager;

    move-result-object v19

    move-object/from16 v0, v19

    move-object/from16 v1, p0

    invoke-virtual {v0, v1}, Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThreadManager;->releaseEglContextLocked(Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThread;)V

    .line 1205
    throw v15

    .line 1259
    .end local v15    # "t":Ljava/lang/RuntimeException;
    :cond_13
    invoke-static {}, Lcom/vk/attachpicker/imageeditor/GLTextureView;->access$800()Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThreadManager;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/Object;->wait()V
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_1

    goto/16 :goto_1

    .line 1269
    .end local v11    # "pausing":Z
    :cond_14
    if-eqz v4, :cond_15

    .line 1273
    :try_start_b
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThread;->mEglHelper:Lcom/vk/attachpicker/imageeditor/GLTextureView$EglHelper;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lcom/vk/attachpicker/imageeditor/GLTextureView$EglHelper;->createSurface()Z

    move-result v19

    if-eqz v19, :cond_1c

    .line 1274
    invoke-static {}, Lcom/vk/attachpicker/imageeditor/GLTextureView;->access$800()Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThreadManager;

    move-result-object v20

    monitor-enter v20
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_2

    .line 1275
    const/16 v19, 0x1

    :try_start_c
    move/from16 v0, v19

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThread;->mFinishedCreatingEglSurface:Z

    .line 1276
    invoke-static {}, Lcom/vk/attachpicker/imageeditor/GLTextureView;->access$800()Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThreadManager;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/Object;->notifyAll()V

    .line 1277
    monitor-exit v20
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_3

    .line 1286
    const/4 v4, 0x0

    .line 1289
    :cond_15
    if-eqz v5, :cond_16

    .line 1290
    :try_start_d
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThread;->mEglHelper:Lcom/vk/attachpicker/imageeditor/GLTextureView$EglHelper;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lcom/vk/attachpicker/imageeditor/GLTextureView$EglHelper;->createGL()Ljavax/microedition/khronos/opengles/GL;

    move-result-object v19

    move-object/from16 v0, v19

    check-cast v0, Ljavax/microedition/khronos/opengles/GL10;

    move-object v8, v0

    .line 1292
    invoke-static {}, Lcom/vk/attachpicker/imageeditor/GLTextureView;->access$800()Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThreadManager;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-virtual {v0, v8}, Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThreadManager;->checkGLDriver(Ljavax/microedition/khronos/opengles/GL10;)V

    .line 1293
    const/4 v5, 0x0

    .line 1296
    :cond_16
    if-eqz v3, :cond_18

    .line 1300
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThread;->mGLTextureViewWeakRef:Ljava/lang/ref/WeakReference;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Lcom/vk/attachpicker/imageeditor/GLTextureView;

    .line 1301
    .restart local v16    # "view":Lcom/vk/attachpicker/imageeditor/GLTextureView;
    if-eqz v16, :cond_17

    .line 1302
    invoke-static/range {v16 .. v16}, Lcom/vk/attachpicker/imageeditor/GLTextureView;->access$1000(Lcom/vk/attachpicker/imageeditor/GLTextureView;)Landroid/opengl/GLSurfaceView$Renderer;

    move-result-object v19

    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThread;->mEglHelper:Lcom/vk/attachpicker/imageeditor/GLTextureView$EglHelper;

    move-object/from16 v20, v0

    move-object/from16 v0, v20

    iget-object v0, v0, Lcom/vk/attachpicker/imageeditor/GLTextureView$EglHelper;->mEglConfig:Ljavax/microedition/khronos/egl/EGLConfig;

    move-object/from16 v20, v0

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    invoke-interface {v0, v8, v1}, Landroid/opengl/GLSurfaceView$Renderer;->onSurfaceCreated(Ljavax/microedition/khronos/opengles/GL10;Ljavax/microedition/khronos/egl/EGLConfig;)V

    .line 1304
    :cond_17
    const/4 v3, 0x0

    .line 1307
    .end local v16    # "view":Lcom/vk/attachpicker/imageeditor/GLTextureView;
    :cond_18
    if-eqz v13, :cond_1a

    .line 1311
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThread;->mGLTextureViewWeakRef:Ljava/lang/ref/WeakReference;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Lcom/vk/attachpicker/imageeditor/GLTextureView;

    .line 1312
    .restart local v16    # "view":Lcom/vk/attachpicker/imageeditor/GLTextureView;
    if-eqz v16, :cond_19

    .line 1313
    invoke-static/range {v16 .. v16}, Lcom/vk/attachpicker/imageeditor/GLTextureView;->access$1000(Lcom/vk/attachpicker/imageeditor/GLTextureView;)Landroid/opengl/GLSurfaceView$Renderer;

    move-result-object v19

    move-object/from16 v0, v19

    move/from16 v1, v17

    invoke-interface {v0, v8, v1, v9}, Landroid/opengl/GLSurfaceView$Renderer;->onSurfaceChanged(Ljavax/microedition/khronos/opengles/GL10;II)V

    .line 1315
    :cond_19
    const/4 v13, 0x0

    .line 1322
    .end local v16    # "view":Lcom/vk/attachpicker/imageeditor/GLTextureView;
    :cond_1a
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThread;->mGLTextureViewWeakRef:Ljava/lang/ref/WeakReference;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Lcom/vk/attachpicker/imageeditor/GLTextureView;

    .line 1323
    .restart local v16    # "view":Lcom/vk/attachpicker/imageeditor/GLTextureView;
    if-eqz v16, :cond_1b

    .line 1324
    invoke-static/range {v16 .. v16}, Lcom/vk/attachpicker/imageeditor/GLTextureView;->access$1000(Lcom/vk/attachpicker/imageeditor/GLTextureView;)Landroid/opengl/GLSurfaceView$Renderer;

    move-result-object v19

    move-object/from16 v0, v19

    invoke-interface {v0, v8}, Landroid/opengl/GLSurfaceView$Renderer;->onDrawFrame(Ljavax/microedition/khronos/opengles/GL10;)V

    .line 1327
    :cond_1b
    move-object/from16 v0, p0

    iget-object v0, v0, Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThread;->mEglHelper:Lcom/vk/attachpicker/imageeditor/GLTextureView$EglHelper;

    move-object/from16 v19, v0

    invoke-virtual/range {v19 .. v19}, Lcom/vk/attachpicker/imageeditor/GLTextureView$EglHelper;->swap()I

    move-result v14

    .line 1328
    .local v14, "swapError":I
    sparse-switch v14, :sswitch_data_0

    .line 1342
    const-string/jumbo v19, "GLThread"

    const-string/jumbo v20, "eglSwapBuffers"

    move-object/from16 v0, v19

    move-object/from16 v1, v20

    invoke-static {v0, v1, v14}, Lcom/vk/attachpicker/imageeditor/GLTextureView$EglHelper;->logEglErrorAsWarning(Ljava/lang/String;Ljava/lang/String;I)V

    .line 1344
    invoke-static {}, Lcom/vk/attachpicker/imageeditor/GLTextureView;->access$800()Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThreadManager;

    move-result-object v20

    monitor-enter v20
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_2

    .line 1345
    const/16 v19, 0x1

    :try_start_e
    move/from16 v0, v19

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThread;->mSurfaceIsBad:Z

    .line 1346
    invoke-static {}, Lcom/vk/attachpicker/imageeditor/GLTextureView;->access$800()Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThreadManager;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/Object;->notifyAll()V

    .line 1347
    monitor-exit v20
    :try_end_e
    .catchall {:try_start_e .. :try_end_e} :catchall_5

    .line 1351
    :goto_5
    :sswitch_0
    if-eqz v18, :cond_0

    .line 1352
    const/4 v6, 0x1

    goto/16 :goto_0

    .line 1277
    .end local v14    # "swapError":I
    .end local v16    # "view":Lcom/vk/attachpicker/imageeditor/GLTextureView;
    :catchall_3
    move-exception v19

    :try_start_f
    monitor-exit v20
    :try_end_f
    .catchall {:try_start_f .. :try_end_f} :catchall_3

    :try_start_10
    throw v19

    .line 1279
    :cond_1c
    invoke-static {}, Lcom/vk/attachpicker/imageeditor/GLTextureView;->access$800()Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThreadManager;

    move-result-object v20

    monitor-enter v20
    :try_end_10
    .catchall {:try_start_10 .. :try_end_10} :catchall_2

    .line 1280
    const/16 v19, 0x1

    :try_start_11
    move/from16 v0, v19

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThread;->mFinishedCreatingEglSurface:Z

    .line 1281
    const/16 v19, 0x1

    move/from16 v0, v19

    move-object/from16 v1, p0

    iput-boolean v0, v1, Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThread;->mSurfaceIsBad:Z

    .line 1282
    invoke-static {}, Lcom/vk/attachpicker/imageeditor/GLTextureView;->access$800()Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThreadManager;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/Object;->notifyAll()V

    .line 1283
    monitor-exit v20

    goto/16 :goto_0

    :catchall_4
    move-exception v19

    monitor-exit v20
    :try_end_11
    .catchall {:try_start_11 .. :try_end_11} :catchall_4

    :try_start_12
    throw v19
    :try_end_12
    .catchall {:try_start_12 .. :try_end_12} :catchall_2

    .line 1335
    .restart local v14    # "swapError":I
    .restart local v16    # "view":Lcom/vk/attachpicker/imageeditor/GLTextureView;
    :sswitch_1
    const/4 v10, 0x1

    .line 1336
    goto :goto_5

    .line 1347
    :catchall_5
    move-exception v19

    :try_start_13
    monitor-exit v20
    :try_end_13
    .catchall {:try_start_13 .. :try_end_13} :catchall_5

    :try_start_14
    throw v19
    :try_end_14
    .catchall {:try_start_14 .. :try_end_14} :catchall_2

    .line 1363
    .end local v14    # "swapError":I
    .end local v16    # "view":Lcom/vk/attachpicker/imageeditor/GLTextureView;
    :catchall_6
    move-exception v19

    :try_start_15
    monitor-exit v20
    :try_end_15
    .catchall {:try_start_15 .. :try_end_15} :catchall_6

    throw v19

    .line 1328
    nop

    :sswitch_data_0
    .sparse-switch
        0x3000 -> :sswitch_0
        0x300e -> :sswitch_1
    .end sparse-switch
.end method

.method private readyToDraw()Z
    .locals 2

    .prologue
    const/4 v0, 0x1

    .line 1372
    iget-boolean v1, p0, Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThread;->mPaused:Z

    if-nez v1, :cond_1

    iget-boolean v1, p0, Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThread;->mHasSurface:Z

    if-eqz v1, :cond_1

    iget-boolean v1, p0, Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThread;->mSurfaceIsBad:Z

    if-nez v1, :cond_1

    iget v1, p0, Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThread;->mWidth:I

    if-lez v1, :cond_1

    iget v1, p0, Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThread;->mHeight:I

    if-lez v1, :cond_1

    iget-boolean v1, p0, Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThread;->mRequestRender:Z

    if-nez v1, :cond_0

    iget v1, p0, Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThread;->mRenderMode:I

    if-ne v1, v0, :cond_1

    :cond_0
    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private stopEglContextLocked()V
    .locals 1

    .prologue
    .line 1063
    iget-boolean v0, p0, Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThread;->mHaveEglContext:Z

    if-eqz v0, :cond_0

    .line 1064
    iget-object v0, p0, Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThread;->mEglHelper:Lcom/vk/attachpicker/imageeditor/GLTextureView$EglHelper;

    invoke-virtual {v0}, Lcom/vk/attachpicker/imageeditor/GLTextureView$EglHelper;->finish()V

    .line 1065
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThread;->mHaveEglContext:Z

    .line 1066
    invoke-static {}, Lcom/vk/attachpicker/imageeditor/GLTextureView;->access$800()Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThreadManager;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThreadManager;->releaseEglContextLocked(Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThread;)V

    .line 1068
    :cond_0
    return-void
.end method

.method private stopEglSurfaceLocked()V
    .locals 1

    .prologue
    .line 1052
    iget-boolean v0, p0, Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThread;->mHaveEglSurface:Z

    if-eqz v0, :cond_0

    .line 1053
    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThread;->mHaveEglSurface:Z

    .line 1054
    iget-object v0, p0, Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThread;->mEglHelper:Lcom/vk/attachpicker/imageeditor/GLTextureView$EglHelper;

    invoke-virtual {v0}, Lcom/vk/attachpicker/imageeditor/GLTextureView$EglHelper;->destroySurface()V

    .line 1056
    :cond_0
    return-void
.end method


# virtual methods
.method public ableToDraw()Z
    .locals 1

    .prologue
    .line 1368
    iget-boolean v0, p0, Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThread;->mHaveEglContext:Z

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThread;->mHaveEglSurface:Z

    if-eqz v0, :cond_0

    invoke-direct {p0}, Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThread;->readyToDraw()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getRenderMode()I
    .locals 2

    .prologue
    .line 1388
    invoke-static {}, Lcom/vk/attachpicker/imageeditor/GLTextureView;->access$800()Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThreadManager;

    move-result-object v1

    monitor-enter v1

    .line 1389
    :try_start_0
    iget v0, p0, Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThread;->mRenderMode:I

    monitor-exit v1

    return v0

    .line 1390
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public onPause()V
    .locals 3

    .prologue
    .line 1438
    invoke-static {}, Lcom/vk/attachpicker/imageeditor/GLTextureView;->access$800()Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThreadManager;

    move-result-object v2

    monitor-enter v2

    .line 1442
    const/4 v1, 0x1

    :try_start_0
    iput-boolean v1, p0, Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThread;->mRequestPaused:Z

    .line 1443
    invoke-static {}, Lcom/vk/attachpicker/imageeditor/GLTextureView;->access$800()Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThreadManager;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->notifyAll()V

    .line 1444
    :goto_0
    iget-boolean v1, p0, Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThread;->mExited:Z

    if-nez v1, :cond_0

    iget-boolean v1, p0, Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThread;->mPaused:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v1, :cond_0

    .line 1449
    :try_start_1
    invoke-static {}, Lcom/vk/attachpicker/imageeditor/GLTextureView;->access$800()Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThreadManager;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->wait()V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 1450
    :catch_0
    move-exception v0

    .line 1451
    .local v0, "ex":Ljava/lang/InterruptedException;
    :try_start_2
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Thread;->interrupt()V

    goto :goto_0

    .line 1454
    .end local v0    # "ex":Ljava/lang/InterruptedException;
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v1

    :cond_0
    :try_start_3
    monitor-exit v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 1455
    return-void
.end method

.method public onResume()V
    .locals 3

    .prologue
    .line 1458
    invoke-static {}, Lcom/vk/attachpicker/imageeditor/GLTextureView;->access$800()Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThreadManager;

    move-result-object v2

    monitor-enter v2

    .line 1462
    const/4 v1, 0x0

    :try_start_0
    iput-boolean v1, p0, Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThread;->mRequestPaused:Z

    .line 1463
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThread;->mRequestRender:Z

    .line 1464
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThread;->mRenderComplete:Z

    .line 1465
    invoke-static {}, Lcom/vk/attachpicker/imageeditor/GLTextureView;->access$800()Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThreadManager;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->notifyAll()V

    .line 1466
    :goto_0
    iget-boolean v1, p0, Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThread;->mExited:Z

    if-nez v1, :cond_0

    iget-boolean v1, p0, Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThread;->mPaused:Z

    if-eqz v1, :cond_0

    iget-boolean v1, p0, Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThread;->mRenderComplete:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v1, :cond_0

    .line 1471
    :try_start_1
    invoke-static {}, Lcom/vk/attachpicker/imageeditor/GLTextureView;->access$800()Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThreadManager;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->wait()V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 1472
    :catch_0
    move-exception v0

    .line 1473
    .local v0, "ex":Ljava/lang/InterruptedException;
    :try_start_2
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Thread;->interrupt()V

    goto :goto_0

    .line 1476
    .end local v0    # "ex":Ljava/lang/InterruptedException;
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v1

    :cond_0
    :try_start_3
    monitor-exit v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 1477
    return-void
.end method

.method public onWindowResize(II)V
    .locals 3
    .param p1, "w"    # I
    .param p2, "h"    # I

    .prologue
    .line 1480
    invoke-static {}, Lcom/vk/attachpicker/imageeditor/GLTextureView;->access$800()Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThreadManager;

    move-result-object v2

    monitor-enter v2

    .line 1481
    :try_start_0
    iput p1, p0, Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThread;->mWidth:I

    .line 1482
    iput p2, p0, Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThread;->mHeight:I

    .line 1483
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThread;->mSizeChanged:Z

    .line 1484
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThread;->mRequestRender:Z

    .line 1485
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThread;->mRenderComplete:Z

    .line 1486
    invoke-static {}, Lcom/vk/attachpicker/imageeditor/GLTextureView;->access$800()Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThreadManager;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->notifyAll()V

    .line 1489
    :goto_0
    iget-boolean v1, p0, Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThread;->mExited:Z

    if-nez v1, :cond_0

    iget-boolean v1, p0, Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThread;->mPaused:Z

    if-nez v1, :cond_0

    iget-boolean v1, p0, Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThread;->mRenderComplete:Z

    if-nez v1, :cond_0

    .line 1490
    invoke-virtual {p0}, Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThread;->ableToDraw()Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    move-result v1

    if-eqz v1, :cond_0

    .line 1495
    :try_start_1
    invoke-static {}, Lcom/vk/attachpicker/imageeditor/GLTextureView;->access$800()Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThreadManager;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->wait()V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 1496
    :catch_0
    move-exception v0

    .line 1497
    .local v0, "ex":Ljava/lang/InterruptedException;
    :try_start_2
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Thread;->interrupt()V

    goto :goto_0

    .line 1500
    .end local v0    # "ex":Ljava/lang/InterruptedException;
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v1

    :cond_0
    :try_start_3
    monitor-exit v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 1501
    return-void
.end method

.method public queueEvent(Ljava/lang/Runnable;)V
    .locals 2
    .param p1, "r"    # Ljava/lang/Runnable;

    .prologue
    .line 1530
    if-nez p1, :cond_0

    .line 1531
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "r must not be null"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1533
    :cond_0
    invoke-static {}, Lcom/vk/attachpicker/imageeditor/GLTextureView;->access$800()Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThreadManager;

    move-result-object v1

    monitor-enter v1

    .line 1534
    :try_start_0
    iget-object v0, p0, Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThread;->mEventQueue:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 1535
    invoke-static {}, Lcom/vk/attachpicker/imageeditor/GLTextureView;->access$800()Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThreadManager;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->notifyAll()V

    .line 1536
    monitor-exit v1

    .line 1537
    return-void

    .line 1536
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public requestExitAndWait()V
    .locals 3

    .prologue
    .line 1506
    invoke-static {}, Lcom/vk/attachpicker/imageeditor/GLTextureView;->access$800()Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThreadManager;

    move-result-object v2

    monitor-enter v2

    .line 1507
    const/4 v1, 0x1

    :try_start_0
    iput-boolean v1, p0, Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThread;->mShouldExit:Z

    .line 1508
    invoke-static {}, Lcom/vk/attachpicker/imageeditor/GLTextureView;->access$800()Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThreadManager;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->notifyAll()V

    .line 1509
    :goto_0
    iget-boolean v1, p0, Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThread;->mExited:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v1, :cond_0

    .line 1511
    :try_start_1
    invoke-static {}, Lcom/vk/attachpicker/imageeditor/GLTextureView;->access$800()Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThreadManager;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->wait()V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 1512
    :catch_0
    move-exception v0

    .line 1513
    .local v0, "ex":Ljava/lang/InterruptedException;
    :try_start_2
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Thread;->interrupt()V

    goto :goto_0

    .line 1516
    .end local v0    # "ex":Ljava/lang/InterruptedException;
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v1

    :cond_0
    :try_start_3
    monitor-exit v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 1517
    return-void
.end method

.method public requestReleaseEglContextLocked()V
    .locals 1

    .prologue
    .line 1520
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThread;->mShouldReleaseEglContext:Z

    .line 1521
    invoke-static {}, Lcom/vk/attachpicker/imageeditor/GLTextureView;->access$800()Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThreadManager;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->notifyAll()V

    .line 1522
    return-void
.end method

.method public requestRender()V
    .locals 2

    .prologue
    .line 1394
    invoke-static {}, Lcom/vk/attachpicker/imageeditor/GLTextureView;->access$800()Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThreadManager;

    move-result-object v1

    monitor-enter v1

    .line 1395
    const/4 v0, 0x1

    :try_start_0
    iput-boolean v0, p0, Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThread;->mRequestRender:Z

    .line 1396
    invoke-static {}, Lcom/vk/attachpicker/imageeditor/GLTextureView;->access$800()Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThreadManager;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->notifyAll()V

    .line 1397
    monitor-exit v1

    .line 1398
    return-void

    .line 1397
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public run()V
    .locals 4

    .prologue
    .line 1033
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "GLThread "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThread;->getId()J

    move-result-wide v2

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThread;->setName(Ljava/lang/String;)V

    .line 1039
    :try_start_0
    invoke-direct {p0}, Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThread;->guardedRun()V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 1043
    invoke-static {}, Lcom/vk/attachpicker/imageeditor/GLTextureView;->access$800()Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThreadManager;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThreadManager;->threadExiting(Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThread;)V

    .line 1045
    :goto_0
    return-void

    .line 1040
    :catch_0
    move-exception v0

    .line 1043
    invoke-static {}, Lcom/vk/attachpicker/imageeditor/GLTextureView;->access$800()Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThreadManager;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThreadManager;->threadExiting(Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThread;)V

    goto :goto_0

    :catchall_0
    move-exception v0

    invoke-static {}, Lcom/vk/attachpicker/imageeditor/GLTextureView;->access$800()Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThreadManager;

    move-result-object v1

    invoke-virtual {v1, p0}, Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThreadManager;->threadExiting(Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThread;)V

    throw v0
.end method

.method public setRenderMode(I)V
    .locals 2
    .param p1, "renderMode"    # I

    .prologue
    .line 1378
    if-ltz p1, :cond_0

    const/4 v0, 0x1

    if-le p1, v0, :cond_1

    .line 1379
    :cond_0
    new-instance v0, Ljava/lang/IllegalArgumentException;

    const-string/jumbo v1, "renderMode"

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 1381
    :cond_1
    invoke-static {}, Lcom/vk/attachpicker/imageeditor/GLTextureView;->access$800()Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThreadManager;

    move-result-object v1

    monitor-enter v1

    .line 1382
    :try_start_0
    iput p1, p0, Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThread;->mRenderMode:I

    .line 1383
    invoke-static {}, Lcom/vk/attachpicker/imageeditor/GLTextureView;->access$800()Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThreadManager;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->notifyAll()V

    .line 1384
    monitor-exit v1

    .line 1385
    return-void

    .line 1384
    :catchall_0
    move-exception v0

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public surfaceCreated()V
    .locals 3

    .prologue
    .line 1401
    invoke-static {}, Lcom/vk/attachpicker/imageeditor/GLTextureView;->access$800()Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThreadManager;

    move-result-object v2

    monitor-enter v2

    .line 1405
    const/4 v1, 0x1

    :try_start_0
    iput-boolean v1, p0, Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThread;->mHasSurface:Z

    .line 1406
    const/4 v1, 0x0

    iput-boolean v1, p0, Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThread;->mFinishedCreatingEglSurface:Z

    .line 1407
    invoke-static {}, Lcom/vk/attachpicker/imageeditor/GLTextureView;->access$800()Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThreadManager;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->notifyAll()V

    .line 1408
    :goto_0
    iget-boolean v1, p0, Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThread;->mWaitingForSurface:Z

    if-eqz v1, :cond_0

    iget-boolean v1, p0, Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThread;->mFinishedCreatingEglSurface:Z

    if-nez v1, :cond_0

    iget-boolean v1, p0, Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThread;->mExited:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v1, :cond_0

    .line 1412
    :try_start_1
    invoke-static {}, Lcom/vk/attachpicker/imageeditor/GLTextureView;->access$800()Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThreadManager;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->wait()V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 1413
    :catch_0
    move-exception v0

    .line 1414
    .local v0, "e":Ljava/lang/InterruptedException;
    :try_start_2
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Thread;->interrupt()V

    goto :goto_0

    .line 1417
    .end local v0    # "e":Ljava/lang/InterruptedException;
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v1

    :cond_0
    :try_start_3
    monitor-exit v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 1418
    return-void
.end method

.method public surfaceDestroyed()V
    .locals 3

    .prologue
    .line 1421
    invoke-static {}, Lcom/vk/attachpicker/imageeditor/GLTextureView;->access$800()Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThreadManager;

    move-result-object v2

    monitor-enter v2

    .line 1425
    const/4 v1, 0x0

    :try_start_0
    iput-boolean v1, p0, Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThread;->mHasSurface:Z

    .line 1426
    invoke-static {}, Lcom/vk/attachpicker/imageeditor/GLTextureView;->access$800()Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThreadManager;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->notifyAll()V

    .line 1427
    :goto_0
    iget-boolean v1, p0, Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThread;->mWaitingForSurface:Z

    if-nez v1, :cond_0

    iget-boolean v1, p0, Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThread;->mExited:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v1, :cond_0

    .line 1429
    :try_start_1
    invoke-static {}, Lcom/vk/attachpicker/imageeditor/GLTextureView;->access$800()Lcom/vk/attachpicker/imageeditor/GLTextureView$GLThreadManager;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->wait()V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    .line 1430
    :catch_0
    move-exception v0

    .line 1431
    .local v0, "e":Ljava/lang/InterruptedException;
    :try_start_2
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Thread;->interrupt()V

    goto :goto_0

    .line 1434
    .end local v0    # "e":Ljava/lang/InterruptedException;
    :catchall_0
    move-exception v1

    monitor-exit v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v1

    :cond_0
    :try_start_3
    monitor-exit v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 1435
    return-void
.end method
