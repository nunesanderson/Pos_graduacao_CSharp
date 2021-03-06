clear all;
close all;
clc;

load -ascII 'out_coordenates.txt'
load -ascII 'out_properties.txt'
load -ascII 'out_vertexes.txt'
load -ascII 'out_results.txt'

n=length(out_vertexes)

for i=1:n(1,1)

    j=1;
    coluna=1;
    for j=1:2:6
    
        nos(i,coluna)=out_vertexes(i,j);
    coluna=coluna+1;
    end
    
end


%%%%%%%%%%% Desenho da malha %%%%%%%%%%%%%%%%%%%%%
faces = nos(:,1:3);    % Define os pontos de cada face

% Cria uma matriz com dados RGB de cada elemento
for i=1:n(1,1)
 
  % material = ar
  tcolor(i,1)=.9;    % r
  tcolor(i,2)=.9;    % g
  tcolor(i,3)=.9;    % b

  if ( out_properties(i,1) ~= 1 )
%    material = outro
    tcolor(i,1)=.3;
    tcolor(i,2)=.1;
    tcolor(i,3)=.4;
  end

end

% Desenha a malha
figure;
patch('Faces',faces,...
      'Vertices',out_coordenates,...
      'FaceVertexCData',tcolor,...
      'FaceLighting','flat',...
      'FaceColor','flat',...
      'FaceAlpha',.3,...
      'EdgeAlpha',.09);
    
hold on  
xmax=max(out_coordenates(:,1));
xmin=min(out_coordenates(:,1));
ymax=max(out_coordenates(:,2));
ymin=min(out_coordenates(:,2));

pdecont(out_coordenates',nos',out_results,10)
axis([xmin xmax ymin ymax])
colorbar('vert')


