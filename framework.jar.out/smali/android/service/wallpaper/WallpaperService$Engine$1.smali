.class Landroid/service/wallpaper/WallpaperService$Engine$1;
.super Landroid/content/BroadcastReceiver;
.source "WallpaperService.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroid/service/wallpaper/WallpaperService$Engine;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Landroid/service/wallpaper/WallpaperService$Engine;


# direct methods
.method constructor <init>(Landroid/service/wallpaper/WallpaperService$Engine;)V
    .locals 0
    .parameter

    .prologue
    .line 178
    iput-object p1, p0, Landroid/service/wallpaper/WallpaperService$Engine$1;->this$1:Landroid/service/wallpaper/WallpaperService$Engine;

    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    return-void
.end method


# virtual methods
.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 5
    .parameter "context"
    .parameter "intent"

    .prologue
    const/16 v4, 0x4e2a

    const/4 v3, 0x1

    .line 181
    const-string v1, "android.intent.action.SCREEN_ON"

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 182
    iget-object v1, p0, Landroid/service/wallpaper/WallpaperService$Engine$1;->this$1:Landroid/service/wallpaper/WallpaperService$Engine;

    iput-boolean v3, v1, Landroid/service/wallpaper/WallpaperService$Engine;->mScreenOn:Z

    .line 185
    iget-object v1, p0, Landroid/service/wallpaper/WallpaperService$Engine$1;->this$1:Landroid/service/wallpaper/WallpaperService$Engine;

    iget-object v1, v1, Landroid/service/wallpaper/WallpaperService$Engine;->mCaller:Lcom/android/internal/os/HandlerCaller;

    invoke-virtual {v1, v4}, Lcom/android/internal/os/HandlerCaller;->obtainMessage(I)Landroid/os/Message;

    move-result-object v0

    .line 186
    .local v0, msg:Landroid/os/Message;
    iget-object v1, p0, Landroid/service/wallpaper/WallpaperService$Engine$1;->this$1:Landroid/service/wallpaper/WallpaperService$Engine;

    iget-object v1, v1, Landroid/service/wallpaper/WallpaperService$Engine;->mCaller:Lcom/android/internal/os/HandlerCaller;

    invoke-virtual {v1, v0}, Lcom/android/internal/os/HandlerCaller;->sendMessage(Landroid/os/Message;)V

    .line 198
    .end local v0           #msg:Landroid/os/Message;
    :cond_0
    :goto_0
    return-void

    .line 188
    :cond_1
    const-string v1, "android.intent.action.SCREEN_OFF"

    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 189
    iget-object v1, p0, Landroid/service/wallpaper/WallpaperService$Engine$1;->this$1:Landroid/service/wallpaper/WallpaperService$Engine;

    const/4 v2, 0x0

    iput-boolean v2, v1, Landroid/service/wallpaper/WallpaperService$Engine;->mScreenOn:Z

    .line 192
    const-string v1, "WallpaperService"

    const-string v2, "Dispatch wallpaper Screen Off, reset mRosieOff=true"

    invoke-static {v1, v2}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    .line 193
    iget-object v1, p0, Landroid/service/wallpaper/WallpaperService$Engine$1;->this$1:Landroid/service/wallpaper/WallpaperService$Engine;

    iput-boolean v3, v1, Landroid/service/wallpaper/WallpaperService$Engine;->mRosieOff:Z

    .line 194
    iget-object v1, p0, Landroid/service/wallpaper/WallpaperService$Engine$1;->this$1:Landroid/service/wallpaper/WallpaperService$Engine;

    iget-object v1, v1, Landroid/service/wallpaper/WallpaperService$Engine;->mCaller:Lcom/android/internal/os/HandlerCaller;

    invoke-virtual {v1, v4}, Lcom/android/internal/os/HandlerCaller;->obtainMessage(I)Landroid/os/Message;

    move-result-object v0

    .line 195
    .restart local v0       #msg:Landroid/os/Message;
    iget-object v1, p0, Landroid/service/wallpaper/WallpaperService$Engine$1;->this$1:Landroid/service/wallpaper/WallpaperService$Engine;

    iget-object v1, v1, Landroid/service/wallpaper/WallpaperService$Engine;->mCaller:Lcom/android/internal/os/HandlerCaller;

    invoke-virtual {v1, v0}, Lcom/android/internal/os/HandlerCaller;->sendMessage(Landroid/os/Message;)V

    goto :goto_0
.end method
